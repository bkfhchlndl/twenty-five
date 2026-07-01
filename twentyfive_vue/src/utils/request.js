import axios from 'axios'
import { ElMessage } from 'element-plus'
import router from '@/router'

// 创建 axios 实例
const service = axios.create({
  baseURL: 'http://localhost:8080', // 后端地址，和你启动的端口一致
  timeout: 10000 // 请求超时时间
})

// 请求拦截器：自动在请求头加 Token
service.interceptors.request.use(
  config => {
    const token = localStorage.getItem('token')
    if (token) {
      config.headers.Authorization = token
    }
    return config
  },
  error => {
    return Promise.reject(error)
  }
)

// 响应拦截器：统一处理后端返回的 Result 格式
service.interceptors.response.use(
  response => {
    const res = response.data
    // code=200 表示业务成功，直接返回 data 数据
    if (res.code === 200) {
      return res.data
    } else {
      // 业务失败，弹出错误提示
      ElMessage.error(res.msg || '请求失败')
      // 401 未登录，清除 token 跳登录页
      if (res.code === 401) {
        localStorage.removeItem('token')
        router.push('/login')
      }
      return Promise.reject(new Error(res.msg))
    }
  },
  error => {
    ElMessage.error('网络异常，请检查后端是否启动')
    return Promise.reject(error)
  }
)

export default service