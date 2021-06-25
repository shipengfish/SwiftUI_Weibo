//
//  PostApi.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/3/20.
//

import Foundation
import Moya
import HandyJSON

enum PostApi {
    // 推荐列表
    case recommendList
    // 热门列表
    case hotList
}

extension PostApi: TargetType {
    var baseURL: URL {
        return URL(string: BaseURL)!
    }
    
    var path: String {
        switch self {
        case .recommendList: return "/recommend/list"
        case .hotList: return "/hot/list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .recommendList: return .get
        case .hotList: return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .recommendList:
            return .requestParameters(parameters: ["pageNum": 1, "pageSize": 10], encoding: URLEncoding.default)
            
        case .hotList:
            return .requestParameters(parameters: ["pageNum": 1, "pageSize": 10], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
