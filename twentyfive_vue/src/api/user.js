import request from '@/utils/request'

// 用户注册 - 发送验证码
export function sendCode(email) {
  return request({
    url: '/user/sendCode',
    method: 'get',
    params: { email }
  })
}

// 用户注册
export function register(data) {
  return request({
    url: '/user/register',
    method: 'post',
    data
  })
}

// 用户登录
export function login(data) {
  return request({
    url: '/user/login',
    method: 'post',
    data
  })
}

// 获取当前用户信息
export function getUserInfo() {
  return request({
    url: '/user/info',
    method: 'get'
  })
}

// 用户登出
export function logout() {
  return request({
    url: '/user/logout',
    method: 'post'
  })
}

// 重置密码 - 发送验证码
export function resetPasswordSendCode(email) {
  return request({
    url: '/user/resetPasswordSendCode',
    method: 'get',
    params: { email }
  })
}

// 重置密码
export function resetPassword(data) {
  return request({
    url: '/user/resetPassword',
    method: 'post',
    data
  })
}