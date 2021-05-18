//
//  User.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/5/18.
//

import Foundation
import HandyJSON

struct UserList: HandyJSON {
    var list: [User]?
}

struct User: HandyJSON {
    var id: Int = 0
    // 账号
    var userName: String?
    // 姓名
    var realName: String?
    // 身份证号
    var identity: String?
    // 认证状态
    var status: Bool = false
    // 是否启用
    var enable: Bool?
    // 创建时间
    var createTime: String?
}
