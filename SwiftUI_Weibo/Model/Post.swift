//
//  Post.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/3/20.
//

import Foundation
import HandyJSON
import Kingfisher

struct PostList: HandyJSON {
    var list: [Post]?
}

struct Post: HandyJSON, Identifiable {
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

extension Post {
    var avatarImage: KFImage {
        return KFImage(URL(string: PicURL + avatar!))
    }
    
    var commentCountText: String {
        if commentCount <= 0 { return "评论" }
        if commentCount < 1000 { return "\(commentCount)" }
        return String(format: "%.1fK", Double(commentCount) / 1000)
    }
    
    var likeCountText: String {
        if likeCount <= 0 { return "点赞" }
        if likeCount < 1000 { return "\(likeCount)" }
        return String(format: "%.1fK", Double(likeCount) / 1000)
    }
}
