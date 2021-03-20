//
//  Post.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/3/20.
//

import Foundation

struct PostList: Codable {
    var list: [Post]
}

struct Post: Codable, Identifiable {
    let id: Int
    // 头像
    let avatar: String
    // 是否vip
    let vip: Bool
    // 姓名
    let name: String
    // 时间
    let date: String
    // 是否关注
    var isFollowed: Bool
    // 微博内容
    let text: String
    // 微博图片
    let images: [String]
    // 评论量
    var commentCount: Int
    // 点赞量
    var likeCount: Int
    // 是否点赞
    var isLiked: Bool
}
