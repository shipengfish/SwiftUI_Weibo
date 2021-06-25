//
//  MoyaConfig.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/5/18.
//

import Foundation
import HandyJSON

// 基础url
let BaseURL = "https://mock.n1.qcdl.com.cn/mock/60acb19322cd6d00185f54b9/weibo"
let PicURL = "https://oss.n1.qcdl.com.cn/weibo/"

// 公共请求头
let commonHeaders = [
    "Content-Type": "application/json;charset=utf-8",
    "Authorization": "Bearer xxxxx"
]

// 请求超时时长
var requestTimeout: Double = 30

// 响应体
struct ResponseModel<T: HandyJSON>: HandyJSON {
    // 状态码
    var code: String?
    // 提示消息
    var message: String?
    // 返回数据
    var data: T?
    // 提示消息
    var timestamp: String?
}

// 响应体字段
let codeKey = "code"
let messageKey = "message"
let dataKey = "data"
// 默认成功状态码
let successCode = "00000"
