<template>
  <div class="home-page">
    <div class="top-header">
      <div class="header-left">
        <span class="site-name">我的站点</span>
      </div>
      <div class="header-right">
        <el-badge :value="unreadCount" class="message-badge" :offset="[-2, 4]">
          <button class="header-action" type="button" aria-label="消息">
            <el-icon :size="20">
              <Bell />
            </el-icon>
          </button>
        </el-badge>
        <button class="header-action" type="button" aria-label="锁定">
          <el-icon :size="21">
            <Lock />
          </el-icon>
        </button>
        <el-avatar class="header-avatar" :src="avatarSrc" :size="40" />
      </div>
    </div>

    <main class="home-content">
      <section class="notebook-panel">
        <div class="notebook-toolbar">
          <div class="title-row">
            <h2 class="notebook-title">感时花溅泪</h2>
            <span class="notebook-count">{{ quotationList.length }} 条记录</span>
          </div>
          <div class="toolbar-actions">
            <el-button :icon="Edit" @click="openPicker('edit')">编辑</el-button>
            <el-button :icon="Delete" @click="openPicker('delete')">删除</el-button>
            <el-button type="primary" :icon="Plus" @click="openCreate">新增</el-button>
          </div>
        </div>

        <div v-loading="loading" class="quotation-list">
          <el-empty v-if="!loading && quotationList.length === 0" description="暂无记录" />
          <article v-for="item in quotationList" :key="item.id" class="quotation-item">
            <div class="quotation-main">
              <p class="quotation-content">{{ item.statementContent }}</p>
            </div>
          </article>
        </div>
      </section>

      <section class="card-panel">
        <div class="card-toolbar">
          <div class="title-row">
            <h2 class="notebook-title">快捷入口</h2>
            <span class="notebook-count">{{ cardList.length }} 个卡片</span>
          </div>
          <div class="toolbar-actions">
            <el-button :icon="Edit" @click="openCardPicker('edit')">编辑</el-button>
            <el-button :icon="Delete" @click="openCardPicker('delete')">删除</el-button>
            <el-button type="primary" :icon="Plus" @click="openCardCreate">新增</el-button>
          </div>
        </div>

        <div v-loading="cardLoading" class="card-list">
          <el-empty v-if="!cardLoading && cardList.length === 0" description="暂无卡片" />
          <button
            v-for="card in cardList"
            :key="card.id"
            class="home-card"
            type="button"
            @click="handleCardClick(card)"
          >
            <img
              v-if="card.imagePath"
              class="home-card-image"
              :src="resolveImagePath(card.imagePath)"
              :alt="card.title"
            />
            <div v-else class="home-card-image home-card-placeholder">
              {{ getCardInitial(card.title) }}
            </div>
            <div class="home-card-title">{{ card.title }}</div>
          </button>
        </div>
      </section>
    </main>

    <el-dialog
      class="notebook-dialog"
      v-model="cardPickerVisible"
      :title="cardPickerMode === 'edit' ? '选择要编辑的卡片' : '选择要删除的卡片'"
      width="620px"
    >
      <div class="picker-list">
        <el-empty v-if="cardList.length === 0" description="暂无卡片" />
        <div v-for="card in cardList" :key="card.id" class="picker-item">
          <button class="picker-select" type="button" @click="handleCardPickerSelect(card)">
            <span class="picker-content">{{ card.title }}</span>
          </button>
          <div v-if="cardPickerMode === 'edit'" class="sort-controls">
            <span class="picker-meta">排序 {{ card.sort ?? 0 }}</span>
            <el-button size="small" :icon="Minus" @click.stop="changeCardSort(card, -1)" />
            <el-button size="small" :icon="Plus" @click.stop="changeCardSort(card, 1)" />
          </div>
        </div>
      </div>
    </el-dialog>

    <el-dialog
      class="notebook-dialog"
      v-model="cardEditorVisible"
      :title="cardEditingId ? '编辑卡片' : '新增卡片'"
      width="560px"
      @closed="resetCardEditor"
    >
      <div class="card-editor-dialog">
        <el-form label-width="76px">
          <el-form-item label="标题">
            <el-input v-model="cardForm.title" maxlength="30" placeholder="请输入卡片标题" />
          </el-form-item>
          <el-form-item label="路径">
            <el-input v-model="cardForm.path" placeholder="例如 /homepage 或 https://..." />
          </el-form-item>
          <el-form-item label="排序">
            <el-input-number v-model="cardForm.sort" :min="0" controls-position="right" />
          </el-form-item>
          <el-form-item label="图片">
            <el-upload
              class="card-uploader"
              :show-file-list="false"
              :auto-upload="false"
              accept="image/*"
              :on-change="handleCardImageChange"
            >
              <img
                v-if="cardForm.imagePath"
                class="card-upload-preview"
                :src="resolveImagePath(cardForm.imagePath)"
                alt="卡片图片"
              />
              <div v-else class="card-upload-placeholder">
                <el-icon :size="22">
                  <Plus />
                </el-icon>
              </div>
            </el-upload>
          </el-form-item>
        </el-form>
        <div class="editor-actions">
          <span></span>
          <div class="editor-buttons">
            <el-button :icon="Close" @click="cardEditorVisible = false">取消</el-button>
            <el-button type="primary" :icon="Check" :loading="cardSaving" @click="saveCard">
              保存
            </el-button>
          </div>
        </div>
      </div>
    </el-dialog>

    <el-dialog
      class="notebook-dialog"
      v-model="pickerVisible"
      :title="pickerMode === 'edit' ? '选择要编辑的记录' : '选择要删除的记录'"
      width="620px"
    >
      <div class="picker-list">
        <el-empty v-if="quotationList.length === 0" description="暂无记录" />
        <div
          v-for="item in quotationList"
          :key="item.id"
          class="picker-item"
        >
          <button class="picker-select" type="button" @click="handlePickerSelect(item)">
            <span class="picker-content">{{ item.statementContent }}</span>
          </button>
          <div v-if="pickerMode === 'edit'" class="sort-controls">
            <span class="picker-meta">{{ item.sort ?? 0 }}</span>
            <el-button size="small" :icon="Minus" @click.stop="changeSort(item, -1)" />
            <el-button size="small" :icon="Plus" @click.stop="changeSort(item, 1)" />
          </div>
        </div>
      </div>
    </el-dialog>

    <el-dialog
      class="notebook-dialog"
      v-model="editorVisible"
      :title="editingId ? '编辑记事' : '新增记事'"
      width="560px"
      @closed="resetEditor"
    >
      <div class="notebook-editor-dialog">
        <el-input
          v-model="form.statementContent"
          type="textarea"
          :rows="6"
          maxlength="500"
          show-word-limit
          placeholder="写点什么..."
        />
        <div class="editor-actions">
          <div class="editor-options">
            <el-switch v-model="form.isTop" active-text="置顶" />
          </div>
          <div class="editor-buttons">
            <el-button :icon="Close" @click="editorVisible = false">取消</el-button>
            <el-button type="primary" :icon="Check" :loading="saving" @click="saveQuotation">
              保存
            </el-button>
          </div>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script setup>
import { computed, onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Bell, Check, Close, Delete, Edit, Lock, Minus, Plus } from '@element-plus/icons-vue'
import { getUserInfo } from '@/api/user'
import { deleteCard, insertCard, selectAllCard, updateCard, uploadImage } from '@/api/card'
import {
  deleteQuotation,
  insertQuotation,
  selectQuotationList,
  updateQuotation
} from '@/api/quotation'

const router = useRouter()
const unreadCount = ref(6)
const userInfo = ref(null)
const defaultAvatar = '/Trees.jpg'
const avatarSrc = computed(() => userInfo.value?.avatar || defaultAvatar)

const quotationList = ref([])
const cardList = ref([])
const loading = ref(false)
const cardLoading = ref(false)
const cardSaving = ref(false)
const saving = ref(false)
const editorVisible = ref(false)
const editingId = ref(null)
const pickerVisible = ref(false)
const pickerMode = ref('edit')
const cardEditorVisible = ref(false)
const cardEditingId = ref(null)
const cardPickerVisible = ref(false)
const cardPickerMode = ref('edit')
const form = ref({
  statementContent: '',
  sort: 0,
  isTop: false
})
const cardForm = ref({
  title: '',
  path: '',
  imagePath: '',
  sort: 0
})

const loadUserInfo = async () => {
  try {
    userInfo.value = await getUserInfo()
  } catch (error) {
    userInfo.value = null
  }
}

const loadQuotationList = async () => {
  loading.value = true
  try {
    quotationList.value = await selectQuotationList()
  } finally {
    loading.value = false
  }
}

const loadCardList = async () => {
  cardLoading.value = true
  try {
    cardList.value = await selectAllCard()
  } finally {
    cardLoading.value = false
  }
}

const getCardInitial = (title) => {
  return title ? title.trim().slice(0, 1) : '?'
}

const resolveImagePath = (path) => {
  if (!path) {
    return ''
  }

  if (/^(https?:)?\/\//.test(path) || path.startsWith('data:')) {
    return path
  }

  return `http://localhost:8080${path.startsWith('/') ? path : `/${path}`}`
}

const handleCardClick = (card) => {
  if (!card.path) {
    ElMessage.warning('暂无跳转地址')
    return
  }

  if (/^https?:\/\//.test(card.path)) {
    window.open(card.path, '_blank')
    return
  }

  router.push(card.path)
}

const openCardCreate = () => {
  cardPickerVisible.value = false
  cardEditingId.value = null
  cardForm.value = {
    title: '',
    path: '',
    imagePath: '',
    sort: 0
  }
  cardEditorVisible.value = true
}

const openCardPicker = (mode) => {
  if (cardList.value.length === 0) {
    ElMessage.warning('暂无卡片')
    return
  }

  cardPickerMode.value = mode
  cardPickerVisible.value = true
}

const openCardEdit = (card) => {
  cardEditingId.value = card.id
  cardForm.value = {
    title: card.title || '',
    path: card.path || '',
    imagePath: card.imagePath || '',
    sort: card.sort ?? 0
  }
  cardEditorVisible.value = true
}

const handleCardPickerSelect = async (card) => {
  cardPickerVisible.value = false
  if (cardPickerMode.value === 'edit') {
    openCardEdit(card)
    return
  }

  await removeCardItem(card)
}

const changeCardSort = async (card, delta) => {
  const nextSort = Math.max(0, (card.sort ?? 0) + delta)
  await updateCard({
    id: card.id,
    title: card.title,
    path: card.path,
    imagePath: card.imagePath,
    sort: nextSort
  })
  await loadCardList()
}

const handleCardImageChange = async (uploadFile) => {
  const file = uploadFile.raw
  if (!file) {
    return
  }

  cardForm.value.imagePath = await uploadImage(file)
  ElMessage.success('图片上传成功')
}

const resetCardEditor = () => {
  cardEditorVisible.value = false
  cardEditingId.value = null
  cardForm.value = {
    title: '',
    path: '',
    imagePath: '',
    sort: 0
  }
}

const saveCard = async () => {
  const title = cardForm.value.title.trim()
  const path = cardForm.value.path.trim()

  if (!title) {
    ElMessage.warning('请输入卡片标题')
    return
  }

  if (!path) {
    ElMessage.warning('请输入跳转路径')
    return
  }

  cardSaving.value = true
  try {
    const payload = {
      title,
      path,
      imagePath: cardForm.value.imagePath,
      sort: cardForm.value.sort ?? 0
    }

    if (cardEditingId.value) {
      await updateCard({
        ...payload,
        id: cardEditingId.value
      })
      ElMessage.success('卡片修改成功')
    } else {
      await insertCard(payload)
      ElMessage.success('卡片新增成功')
    }

    resetCardEditor()
    await loadCardList()
  } finally {
    cardSaving.value = false
  }
}

const removeCardItem = async (card) => {
  await ElMessageBox.confirm('确定删除这个卡片吗？', '提示', {
    confirmButtonText: '删除',
    cancelButtonText: '取消',
    type: 'warning'
  })

  await deleteCard(card.id)
  ElMessage.success('卡片删除成功')
  await loadCardList()
}

const openCreate = () => {
  pickerVisible.value = false
  editingId.value = null
  form.value = {
    statementContent: '',
    sort: 0,
    isTop: false
  }
  editorVisible.value = true
}

const openPicker = (mode) => {
  if (quotationList.value.length === 0) {
    ElMessage.warning('暂无记录')
    return
  }
  pickerMode.value = mode
  pickerVisible.value = true
}

const openEdit = (item) => {
  editingId.value = item.id
  form.value = {
    statementContent: item.statementContent || '',
    sort: item.sort ?? 0,
    isTop: item.isTop === 1
  }
  editorVisible.value = true
}

const handlePickerSelect = async (item) => {
  pickerVisible.value = false
  if (pickerMode.value === 'edit') {
    openEdit(item)
    return
  }
  await removeQuotationItem(item)
}

const changeSort = async (item, delta) => {
  const nextSort = Math.max(0, (item.sort ?? 0) + delta)
  await updateQuotation({
    id: item.id,
    statementContent: item.statementContent,
    isTop: item.isTop ?? 0,
    sort: nextSort
  })
  await loadQuotationList()
}

const resetEditor = () => {
  editorVisible.value = false
  editingId.value = null
  form.value = {
    statementContent: '',
    sort: 0,
    isTop: false
  }
}

const saveQuotation = async () => {
  const content = form.value.statementContent.trim()
  if (!content) {
    ElMessage.warning('请输入内容')
    return
  }

  saving.value = true
  try {
    const payload = {
      statementContent: content,
      sort: form.value.sort ?? 0,
      isTop: form.value.isTop ? 1 : 0
    }

    if (editingId.value) {
      await updateQuotation({
        ...payload,
        id: editingId.value
      })
      ElMessage.success('修改成功')
    } else {
      await insertQuotation(payload)
      ElMessage.success('新增成功')
    }

    resetEditor()
    await loadQuotationList()
  } finally {
    saving.value = false
  }
}

const removeQuotationItem = async (item) => {
  await ElMessageBox.confirm('确定删除这条记录吗？', '提示', {
    confirmButtonText: '删除',
    cancelButtonText: '取消',
    type: 'warning'
  })

  await deleteQuotation(item.id)
  ElMessage.success('删除成功')
  await loadQuotationList()
}

onMounted(async () => {
  await Promise.all([loadUserInfo(), loadQuotationList(), loadCardList()])
})
</script>

<style scoped>
.home-page {
  height: 100vh;
  background: #fff;
  overflow: hidden;
}

.top-header {
  width: 100%;
  height: 72px;
  padding: 0 48px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #f5f6f8;
  border-bottom: 1px solid #dcdfe6;
  color: #303133;
  box-sizing: border-box;
}

.site-name {
  font-size: 20px;
  font-weight: 500;
}

.header-right {
  display: flex;
  align-items: center;
  gap: 16px;
}

.message-badge {
  height: 36px;
  display: flex;
  align-items: center;
}

.header-action {
  width: 36px;
  height: 36px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0;
  border: 0;
  background: transparent;
  cursor: pointer;
  color: #606266;
  transition: color 0.2s;
}

.header-action:hover {
  color: #303133;
}

.header-avatar {
  flex: 0 0 auto;
  background: #dcdfe6;
  cursor: pointer;
}

.home-content {
  height: calc(100vh - 72px);
  min-height: 0;
  padding: 70px 58px 48px;
  display: flex;
  align-items: flex-start;
  gap: clamp(80px, 17vw, 330px);
  box-sizing: border-box;
  overflow: hidden;
}

.notebook-panel {
  position: relative;
  flex: 0 0 auto;
  width: min(800px, calc(100vw - 116px));
  height: min(740px, calc(100vh - 150px));
  display: flex;
  flex-direction: column;
  background: #eaf5ff;
  border: 1px solid #c9dff2;
  border-radius: 8px;
  box-shadow: 0 10px 28px rgba(55, 96, 132, 0.12);
  overflow: hidden;
}

.card-panel {
  width: 420px;
  height: min(740px, calc(100vh - 150px));
  display: flex;
  flex-direction: column;
  background: #eaf5ff;
  border: 1px solid #c9dff2;
  border-radius: 8px;
  box-shadow: 0 10px 28px rgba(55, 96, 132, 0.12);
  box-sizing: border-box;
  overflow: hidden;
}

.card-toolbar {
  min-height: 74px;
  padding: 0 22px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: rgba(247, 251, 255, 0.92);
  border-bottom: 1px solid #d6e7f7;
  box-sizing: border-box;
}

.card-list {
  flex: 1;
  min-height: 0;
  padding: 18px 22px;
  display: grid;
  grid-template-columns: 1fr;
  align-content: start;
  gap: 16px;
  overflow-y: auto;
  box-sizing: border-box;
}

.home-card {
  width: 100%;
  min-height: 116px;
  padding: 18px 20px;
  display: flex;
  align-items: center;
  gap: 18px;
  border: 1px solid #e1e8f0;
  border-radius: 8px;
  background: #fff;
  box-shadow: 0 8px 20px rgba(50, 86, 120, 0.08);
  color: #303133;
  cursor: pointer;
  text-align: left;
  transition:
    transform 0.18s ease,
    border-color 0.18s ease,
    box-shadow 0.18s ease;
}

.home-card:hover {
  transform: translateY(-2px);
  border-color: #9ecdf5;
  box-shadow: 0 14px 30px rgba(50, 86, 120, 0.14);
}

.card-editor-dialog {
  padding-top: 4px;
}

.card-uploader {
  display: inline-flex;
}

.card-upload-preview,
.card-upload-placeholder {
  width: 92px;
  height: 92px;
  border-radius: 8px;
  border: 1px dashed #b8d8f5;
  background: #eef6ff;
  box-sizing: border-box;
}

.card-upload-preview {
  display: block;
  object-fit: cover;
}

.card-upload-placeholder {
  display: flex;
  align-items: center;
  justify-content: center;
  color: #409eff;
}

.home-card-image {
  width: 64px;
  height: 64px;
  flex: 0 0 auto;
  border-radius: 8px;
  object-fit: cover;
  background: #eef6ff;
}

.home-card-placeholder {
  display: flex;
  align-items: center;
  justify-content: center;
  color: #409eff;
  font-size: 24px;
  font-weight: 600;
}

.home-card-title {
  min-width: 0;
  font-size: 18px;
  font-weight: 600;
  line-height: 1.4;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.notebook-toolbar {
  position: relative;
  z-index: 1;
  min-height: 74px;
  padding: 0 22px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: rgba(247, 251, 255, 0.92);
  border-bottom: 1px solid #d6e7f7;
  box-sizing: border-box;
}

.title-row {
  display: flex;
  align-items: baseline;
  gap: 12px;
}

.notebook-title {
  margin: 0;
  font-size: 18px;
  font-weight: 600;
  color: #303133;
}

.notebook-count {
  font-size: 13px;
  color: #909399;
}

.toolbar-actions {
  display: flex;
  align-items: center;
  gap: 10px;
}

.editor-actions {
  margin-top: 12px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
}

.editor-options,
.editor-buttons {
  display: flex;
  align-items: center;
  gap: 12px;
}

.quotation-list {
  position: relative;
  z-index: 1;
  flex: 1;
  min-height: 0;
  padding: 0;
  overflow-y: auto;
}

.quotation-list::-webkit-scrollbar,
.card-list::-webkit-scrollbar,
.picker-list::-webkit-scrollbar {
  width: 8px;
}

.quotation-list::-webkit-scrollbar-thumb,
.card-list::-webkit-scrollbar-thumb,
.picker-list::-webkit-scrollbar-thumb {
  background: #c0c4cc;
  border-radius: 999px;
}

.quotation-list::-webkit-scrollbar-track,
.card-list::-webkit-scrollbar-track,
.picker-list::-webkit-scrollbar-track {
  background: #f5f7fa;
}

.quotation-item {
  position: relative;
  z-index: 2;
  height: 52px;
  padding: 0 22px;
  display: flex;
  align-items: center;
  border-bottom: 1px solid rgba(54, 61, 54, 0.12);
  box-sizing: border-box;
}

.quotation-item:last-child {
  border-bottom: 0;
}

.quotation-main {
  min-width: 0;
  width: 100%;
}

.quotation-content {
  margin: 0;
  color: #303133;
  font-size: 14px;
  line-height: 1.6;
  word-break: break-word;
  white-space: pre-wrap;
}

.picker-list {
  max-height: 360px;
  overflow-y: auto;
}

.picker-item {
  width: 100%;
  min-height: 58px;
  padding: 10px 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
  border-bottom: 0;
  background: transparent;
  text-align: left;
}

.picker-item:hover {
  background: transparent;
}

.picker-select {
  min-width: 0;
  flex: 1;
  padding: 0;
  border: 0;
  background: transparent;
  cursor: pointer;
  text-align: left;
}

.picker-content {
  min-width: 0;
  flex: 1;
  color: #303133;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.picker-meta {
  flex: 0 0 auto;
  color: #909399;
  font-size: 12px;
}

.sort-controls {
  flex: 0 0 auto;
  display: flex;
  align-items: center;
  gap: 6px;
}

.notebook-editor-dialog {
  padding-top: 4px;
}

:deep(.notebook-dialog .el-dialog) {
  border-radius: 10px;
  overflow: hidden;
}

:deep(.notebook-dialog .el-dialog__header) {
  padding: 20px 22px 12px;
  margin-right: 0;
}

:deep(.notebook-dialog .el-dialog__body) {
  padding: 12px 22px 20px;
}

:deep(.notebook-dialog .el-textarea__inner) {
  border-radius: 6px;
}

</style>
