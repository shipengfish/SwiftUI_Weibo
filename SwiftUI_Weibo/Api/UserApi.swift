//
//  UserApi.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/5/18.
//

import Foundation
import Moya
import HandyJSON

enum UserApi {
    // 分页列表
    case page
}

extension UserApi: TargetType {
    var baseURL: URL {
        return URL(string: BaseURL)!
    }
    
    var path: String {
        switch self {
        case .page: return "/user/page"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .page: return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .page:
            return .requestParameters(parameters: ["pageNum": 1, "pageSize": 10], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
