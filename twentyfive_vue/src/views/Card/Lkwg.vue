<script setup lang="ts">
import { useRouter } from 'vue-router'
import { ArrowLeft } from '@element-plus/icons-vue'

const router = useRouter()
</script>

<template>
  <div class="lkwg-page">
    <div class="page-header">
      <button class="back-btn" type="button" @click="router.back()">
        <el-icon :size="18"><ArrowLeft /></el-icon>
        <span>返回</span>
      </button>
      <h1 class="page-title">洛克王国</h1>
    </div>
    <div class="page-content">
      <div class="placeholder-card">
        <span class="placeholder-icon">🏰</span>
        <p class="placeholder-text">洛克王国页面</p>
        <p class="placeholder-sub">在这里添加你的游戏内容</p>
      </div>
    </div>
  </div>
</template>

<style scoped>
.lkwg-page {
  min-height: 100vh;
  background: #f5f6f8;
  padding: 48px;
  box-sizing: border-box;
}

.page-header {
  display: flex;
  align-items: center;
  gap: 20px;
  margin-bottom: 36px;
}

.back-btn {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 8px 16px;
  border: 1px solid #dcdfe6;
  border-radius: 6px;
  background: #fff;
  color: #606266;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.2s;
}

.back-btn:hover {
  color: #409eff;
  border-color: #c6e2ff;
  background: #ecf5ff;
}

.page-title {
  margin: 0;
  font-size: 24px;
  font-weight: 600;
  color: #303133;
}

.page-content {
  display: flex;
  justify-content: center;
  align-items: center;
  padding-top: 80px;
}

.placeholder-card {
  width: 420px;
  padding: 48px 32px;
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
  text-align: center;
}

.placeholder-icon {
  font-size: 56px;
  display: block;
  margin-bottom: 16px;
}

.placeholder-text {
  margin: 0 0 8px;
  font-size: 20px;
  font-weight: 600;
  color: #303133;
}

.placeholder-sub {
  margin: 0;
  font-size: 14px;
  color: #909399;
}
</style>
