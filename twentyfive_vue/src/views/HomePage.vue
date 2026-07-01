<template>
  <div class="top-header">
    <div class="header-left">
      <span class="site-name">我的站点</span>
    </div>
    <div class="header-right">
      <!-- 消息通知图标 -->
      <el-badge :value="unreadCount" class="header-icon">
        <el-icon :size="20"><Bell /></el-icon>
      </el-badge>
      <!-- 用户头像 -->
      <el-avatar
        class="header-avatar"
        src="/avatar.jpg"
        size="40"
        @click="handleAvatarClick"
      />
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { Bell } from '@element-plus/icons-vue'

// 未读消息数量，设为0则不显示红点
const unreadCount = ref(3)

const handleAvatarClick = () => {
  // 点击头像的逻辑，比如跳转个人中心、弹出菜单
}
</script>

<style scoped>
.top-header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 64px;
  padding: 0 40px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(12px);
  border-bottom: 1px solid rgba(255, 255, 255, 0.15);
  color: #303133;
  box-sizing: border-box;
  z-index: 999;
}

.site-name {
  font-size: 20px;
  font-weight: 500;
}

.header-right {
  display: flex;
  align-items: center;
  gap: 24px;
}

.header-icon {
  cursor: pointer;
  transition: opacity 0.2s;
}
.header-icon:hover {
  opacity: 0.8;
}

.header-avatar {
  cursor: pointer;
  border: 2px solid rgba(255, 255, 255, 0.3);
}
</style>