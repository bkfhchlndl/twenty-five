import request from '@/utils/request.js'

// 单独的上传图片封装
export function uploadImage(file){
    const formData = new FormData()
    formData.append('file', file) // 参数名和后端 @RequestParam("file") 对应
    return request({
        url: '/uploadImage',
        method: 'post',
        data: formData
    })
}