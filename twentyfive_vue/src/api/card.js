import request from '@/utils/request.js'

// 查询所有卡片
export function selectAllCard() {
  return request({
    url: '/card/selectAllCard',
    method: 'get',
  })
}

// 添加卡片
export function insertCard(data) {
  return request({
    url: '/card/insertCard',
    method: 'post',
    data
  })
}

// 删除卡片
export function deleteCard(id) {
  return request({
    url: '/card/deleteCard',
    method: 'delete',
    params: {
      id
    }
  })
}

// 修改卡片
export function updateCard(data) {
  return request({
    url: '/card/updateCard',
    method: 'put',
    data
  })
}

