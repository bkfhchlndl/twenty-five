<template>
  <div class="register-container">
    <!-- 飘落雪花 -->
    <div class="snowflakes">
      <div class="snowflake" v-for="i in 50" :key="'s'+i" :style="snowStyle(i)">❄</div>
    </div>
    <!-- 底部波浪 -->
    <div class="waves">
      <div class="wave wave1"></div>
      <div class="wave wave2"></div>
      <div class="wave wave3"></div>
    </div>
    <el-card class="register-card">
      <h2 class="title">用户注册</h2>
      <el-form :model="registerForm" :rules="rules" ref="registerFormRef" label-width="100px">
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="registerForm.email" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="验证码" prop="code">
          <div style="display:flex; gap:10px">
            <el-input v-model="registerForm.code" placeholder="请输入验证码" style="flex:1" />
            <el-button
              :disabled="countDown > 0"
              @click="handleSendCode"
              style="width:120px"
            >
              {{ countDown > 0 ? `${countDown}秒后重发` : '发送验证码' }}
            </el-button>
          </div>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input v-model="registerForm.password" type="password" placeholder="请输入密码" />
        </el-form-item>
        <el-form-item label="确认密码" prop="confirmPassword">
          <el-input v-model="registerForm.confirmPassword" type="password" placeholder="请再次输入密码" />
        </el-form-item>
        <el-form-item>
          <el-button class="login-btn" style="width:100%" @click="handleRegister" :loading="loading">
            注册
          </el-button>
        </el-form-item>
        <el-form-item>
          <el-button class="login-btn" style="width:100%" @click="$router.push('/login')">
            登录
          </el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { sendCode, register } from '@/api/user'

const router = useRouter()
const registerFormRef = ref()
const loading = ref(false)
const countDown = ref(0)

const registerForm = ref({
  email: '',
  code: '',
  password: '',
  confirmPassword: ''
})

const validateConfirmPassword = (rule, value, callback) => {
  if (value !== registerForm.value.password) {
    callback(new Error('两次输入的密码不一致'))
  } else {
    callback()
  }
}

const rules = {
  email: [
    { required: true, message: '请输入邮箱', trigger: 'blur' },
    { type: 'email', message: '邮箱格式不正确', trigger: 'blur' }
  ],
  code: [
    { required: true, message: '请输入验证码', trigger: 'blur' },
    { len: 6, message: '验证码为6位数字', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, message: '密码至少6位', trigger: 'blur' }
  ],
  confirmPassword: [
    { required: true, message: '请确认密码', trigger: 'blur' },
    { validator: validateConfirmPassword, trigger: 'blur' }
  ]
}

// 雪花随机样式
const snowStyle = (i) => {
  const size = Math.random() * 16 + 8
  const left = Math.random() * 100
  const delay = Math.random() * 10
  const duration = Math.random() * 5 + 5
  const opacity = Math.random() * 0.6 + 0.4
  return {
    fontSize: size + 'px',
    left: left + '%',
    animationDelay: delay + 's',
    animationDuration: duration + 's',
    opacity: opacity
  }
}

// 发送验证码
const handleSendCode = async () => {
  if (!registerForm.value.email) {
    ElMessage.warning('请先输入邮箱')
    return
  }
  await sendCode(registerForm.value.email)
  ElMessage.success('验证码发送成功')

  countDown.value = 60
  const timer = setInterval(() => {
    countDown.value--
    if (countDown.value <= 0) {
      clearInterval(timer)
    }
  }, 1000)
}

// 提交注册
const handleRegister = async () => {
  await registerFormRef.value.validate()
  loading.value = true
  try {
    await register(registerForm.value)
    ElMessage.success('注册成功，请登录')
    router.push('/login')
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
.register-container {
  display: flex;
  justify-content: flex-start;
  align-items: flex-start;
  padding: 70px 0 0 40px;
  height: 100vh;
  background-image: url('/Trees.jpg');
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
  overflow: hidden;
  position: relative;
}
.register-card {
  width: 420px;
  padding: 40px 45px;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(12px);
  border-radius: 16px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
  border: 1px solid rgba(255, 255, 255, 0.15);
  position: relative;
  z-index: 2;
}
.title {
  text-align: center;
  margin-bottom: 30px;
  font-size: 24px;
  font-weight: 500;
  color: #fff;
}
:deep(.el-form-item__label) {
  font-size: 16px;
  color: #fff;
}
:deep(.el-input__wrapper) {
  background: rgba(255, 255, 255, 0.1) !important;
  box-shadow: none !important;
  border: 1px solid rgba(255, 255, 255, 0.3);
}
:deep(.el-input__inner) {
  color: #fff;
}
:deep(.el-input__inner::placeholder) {
  color: rgba(255, 255, 255, 0.5);
}
:deep(.el-button) {
  padding: 12px 20px;
  font-size: 16px;
  text-align: center;
}
/* 雪花容器 */
.snowflakes {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: 1;
  overflow: hidden;
}
/* 单个雪花 */
.snowflake {
  position: absolute;
  top: -30px;
  color: #fff;
  text-shadow: 0 0 5px rgba(255, 255, 255, 0.8);
  animation: snowFall linear infinite;
  user-select: none;
}
/* 雪花飘落动画 */
@keyframes snowFall {
  0% {
    transform: translateY(0) translateX(0) rotate(0deg);
    opacity: 1;
  }
  25% {
    transform: translateY(25vh) translateX(15px) rotate(90deg);
  }
  50% {
    transform: translateY(50vh) translateX(-10px) rotate(180deg);
    opacity: 0.8;
  }
  75% {
    transform: translateY(75vh) translateX(20px) rotate(270deg);
  }
  100% {
    transform: translateY(110vh) translateX(-15px) rotate(360deg);
    opacity: 0.3;
  }
}
/* 波浪容器 */
.waves {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 120px;
  z-index: 1;
  overflow: hidden;
}
/* 波浪层 */
.wave {
  position: absolute;
  bottom: 0;
  left: -100%;
  width: 300%;
  height: 100%;
  background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1440 320'%3E%3Cpath fill='rgba(255,255,255,0.1)' d='M0,192L48,197.3C96,203,192,213,288,229.3C384,245,480,267,576,250.7C672,235,768,181,864,181.3C960,181,1056,235,1152,234.7C1248,235,1344,181,1392,154.7L1440,128L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z'%3E%3C/path%3E%3C/svg%3E") repeat-x;
  background-size: 1440px 120px;
}
.wave1 {
  animation: waveMove 8s linear infinite;
  opacity: 0.6;
}
.wave2 {
  animation: waveMove 12s linear infinite;
  opacity: 0.4;
  bottom: -10px;
}
.wave3 {
  animation: waveMove 16s linear infinite;
  opacity: 0.2;
  bottom: -20px;
}
/* 波浪移动动画 */
@keyframes waveMove {
  0% { transform: translateX(0); }
  100% { transform: translateX(33.33%); }
}
/* 清除浏览器默认边距，全局禁止页面滚动 */
:global(html),
:global(body) {
  margin: 0;
  padding: 0;
  overflow: hidden;
  height: 100%;
}
.login-btn {
  background: rgba(255, 255, 255, 0.15) !important;
  border: 1px solid rgba(255, 255, 255, 0.3) !important;
  color: #fff !important;
  backdrop-filter: blur(4px);
}
.login-btn:hover {
  background: rgba(255, 255, 255, 0.25) !important;
  border-color: rgba(255, 255, 255, 0.5) !important;
}
</style>
