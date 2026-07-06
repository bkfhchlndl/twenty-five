import request from '@/utils/request.js'

// 添加三国杀角色信息
export function insertSgsInformation(data){
    return request({
        url: '/information/insertSgsInformation',
        method: 'post',
        data
    })
}

// 查询当前用户是否已添加三国杀角色信息
export function existsSgsInformationByUserId(){
    return request({
        url: '/information/existsSgsInformationByUserId',
        method: 'get'
    })
}
