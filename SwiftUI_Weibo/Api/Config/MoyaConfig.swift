//
//  MoyaConfig.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/5/18.
//

import Foundation
import HandyJSON

// 基础url
let BaseURL = "https://api.convenience.qcdl.com.cn"

// 公共请求头
let commonHeaders = [
    "Content-Type": "application/json;charset=utf-8",
    "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhZG1pbl9pZCI6OSwiZXhwIjoxNjIxMzYzNjEwLCJpYXQiOjE2MjEzMjA0MTAsImp0aSI6IjE4OWUyMDYxLWVhZTItNGY2ZS1iMjJlLWM5OTc0NmY4NDNkOCJ9.m1JIl4qdDnCW5fK0MYfVrsjfR0fCocESAet5eIxNjIzPcGzNjyDgLZH8jz0b6tw_DDnl2qz62w2uCzCtw9rcIQqZwCVNWi3KDTlH_ag4Ugr7UWS_gEjgXXwS2ss5wTS4uBzmoxTFLDX-EaTe1gDyEwTf5J-dUEDUIcAQIQmo_AGdo8WDnsjuHPYfyBL5_XxlsBqIIsFCwHRGB5EZH8iSwKtQgCaYyA3J4kCcGgtcj0HU0FgQ0VjEVePrU7a3bubBVh6hNG2nCQq0c_YRDFq733zFwlgU5M89UsoMJejxh6vSEk-ut8FKuGaO-SwuQaPxdGVz6rUl3HEbxkcY8Py27A"
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
