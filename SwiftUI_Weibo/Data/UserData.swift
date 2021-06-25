//
//  UserData.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/6/25.
//

import Foundation
import Combine

class UserData: ObservableObject {
    @Published var recommendPostList: PostList = PostList(list: [])
    @Published var hotPostList: PostList = PostList(list: [])
    
    private var recommendPostDic: [Int: Int] = [:]
    private var hotPostDic: [Int: Int] = [:]
}

enum PostListCategory {
    case recommend, hot
}

extension UserData {
    static let testData: UserData = {
        let data = UserData()
        request(PostApi.recommendList, PostList.self) { (postList) in
            data.handleRefreshPostList(postList, for: .recommend)
        }
        return data
    }()
    
    func postList(for category: PostListCategory) -> PostList {
        switch category {
        case .recommend:
            return recommendPostList
        case .hot:
            return hotPostList
        }
    }
    
    private func handleRefreshPostList(_ list: PostList, for category: PostListCategory) {
        var tempList: [Post] = []
        var tempDic: [Int: Int] = [:]
        for (index, post) in list.list!.enumerated() {
            if tempDic[post.id] != nil { continue }
            tempList.append(post)
            tempDic[post.id] = index
            update(post)
        }
        switch category {
        case .recommend:
            recommendPostList.list = tempList
            recommendPostDic = tempDic
        case .hot:
            hotPostList.list = tempList
            hotPostDic = tempDic
        }
    }
    
    func get(forId id: Int) -> Post? {
        if let index = recommendPostDic[id] {
            return recommendPostList.list?[index]
        }
        if let index = hotPostDic[id] {
            return hotPostList.list?[index]
        }
        return nil
    }
    
    func update(_ post: Post) {
        if let index = recommendPostDic[post.id] {
            recommendPostList.list?[index] = post
        }
        if let index = hotPostDic[post.id] {
            hotPostList.list?[index] = post
        }
    }
}
