//
//  ApiManager.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/3/20.
//

import Foundation
import Moya
import HandyJSON

// 基础url
let BaseURL = "https://github.com/xiaoyouxinqing/PostDemo/raw/master/PostDemo/Resources/"
// 超时时长
private var timeout: Double = 30

// 请求失败回调
typealias FailureCallback = (ResponseModel) -> Void

fileprivate let ApiProvider = MoyaProvider<MultiTarget>()


// 响应类
class ResponseModel {
    // 状态码
    var code: Int = 0000
    // 提示消息
    var msg: String = ""
    // 这里的data用String类型 保存response.data
    var data: String = ""
    // 分页的游标 根据具体的业务选择是否添加这个属性
    var cursor: String = ""
}
