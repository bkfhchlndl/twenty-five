<template>
  <div class="info-container">
    <el-card class="info-card">
      <template #header>
        <div style="display:flex; justify-content:space-between; align-items:center">
          <span>个人信息</span>
          <el-button type="danger" size="small" @click="handleLogout">退出登录</el-button>
        </div>
      </template>
      <el-descriptions :column="1" border v-if="userInfo">
        <el-descriptions-item label="用户ID">{{ userInfo.id }}</el-descriptions-item>
        <el-descriptions-item label="邮箱">{{ userInfo.email }}</el-descriptions-item>
        <el-descriptions-item label="昵称">{{ userInfo.nickname }}</el-descriptions-item>
        <el-descriptions-item label="注册时间">{{ userInfo.createTime }}</el-descriptions-item>
      </el-descriptions>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getUserInfo, logout } from '@/api/user'

const router = useRouter()
const userInfo = ref(null)

// 页面加载就获取用户信息
onMounted(() => {
  loadUserInfo()
})

const loadUserInfo = async () => {
  userInfo.value = await getUserInfo()
}

const handleLogout = () => {
  ElMessageBox.confirm('确定要退出登录吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(async () => {
    await logout()
    localStorage.removeItem('token')
    ElMessage.success('已退出登录')
    router.push('/login')
  }).catch(() => {})
}
</script>

<style scoped>
.info-container {
  padding: 40px;
  background-color: #f5f7fa;
  min-height: 100vh;
}
.info-card {
  max-width: 600px;
  margin: 0 auto;
}
</style>