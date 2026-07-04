import request from '@/utils/request.js'

// 单独的上传图片封装
export function uploadImage(file){
  const formData = new FormData()
  formData.append('file', file) // 参数名和后端 @RequestParam("file") 对应
  return request({
    url: '/card/uploadImage',
    method: 'post',
    data: formData
  })
}

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

