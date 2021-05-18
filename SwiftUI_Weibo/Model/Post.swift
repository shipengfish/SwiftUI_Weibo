//
//  Post.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/3/20.
//

import Foundation
import HandyJSON

struct PostList: HandyJSON {
    var list: [Post]?
}

struct Post: HandyJSON {
    var id: Int = 0
    // 头像
    var avatar: String?
    // 是否vip
    var vip: Bool = false
    // 姓名
    var name: String?
    // 时间
    var date: String?
    // 是否关注
    var isFollowed: Bool = false
    // 微博内容
    var text: String?
    // 微博图片
    var images: [String]?
    // 评论量
    var commentCount: Int = 0
    // 点赞量
    var likeCount: Int = 0
    // 是否点赞
    var isLiked: Bool = false
}
