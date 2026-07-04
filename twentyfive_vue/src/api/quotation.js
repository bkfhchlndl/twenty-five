import request from '@/utils/request'

// 添加语录
export function insertQuotation(data) {
  return request({
    url: '/quotation/insertQuotation',
    method: 'post',
    data
  })
}

// 查询语录
export function selectQuotationList() {
  return request({
    url: '/quotation/selectQuotationList',
    method: 'get'
  })
}

// 删除语录
export function deleteQuotation(id) {
  return request({
    url: '/quotation/deleteQuotation',
    method: 'delete',
    params: { id: id }
  })
}

// 修改语录
export function updateQuotation(data) {
  return request({
    url: '/quotation/updateQuotation',
    method: 'put',
    data
  })
}
