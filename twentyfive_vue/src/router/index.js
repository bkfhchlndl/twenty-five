import { createRouter, createWebHistory } from 'vue-router'
import path from "node:path";

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/views/Login.vue')
  },
  {
    path: '/register',
    name: 'Register',
    component: () => import('@/views/Register.vue')
  },
  {
    path: '/userinfo',
    name: 'UserInfo',
    component: () => import('@/views/UserInfo.vue'),
    meta: { requiresAuth: true } // 标记：需要登录才能访问
  },
  {
    path: '/homepage',
    name: 'HomePage',
    component:() =>import('@/views/HomePage.vue'),
    meta: { requiresAuth: true }
  },
  {
    path: '/',
    redirect: '/userinfo' // 默认跳转到个人信息页
  },
  {
    path: '/resetpassword',
    name: 'ResetPassword',
    component: () => import('@/views/ResetPassword.vue')
  },
  {
    path: '/card',
    name: 'Card',
    meta: { requiresAuth: true },
    children: [
      {
        path: 'sgs',
        name: 'Sgs',
        component: () => import('@/views/Card/Sgs.vue')
      },
      {
        path: 'lkwg',
        name: 'Lkwg',
        component: () => import('@/views/Card/Lkwg.vue')
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes: routes
})

// 全局路由守卫：未登录拦截
router.beforeEach((to) => {
  const token = localStorage.getItem('token')
  // 页面需要登录 && 没有 token → 跳登录页
  if (to.meta.requiresAuth && !token) {
    return '/login'
  }
})

export default router