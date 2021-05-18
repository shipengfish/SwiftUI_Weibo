//
//  ApiManager.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/3/20.
//

import Foundation
import Moya
import HandyJSON
import Alamofire

// 请求成功回调
typealias SuccessCallback<T: HandyJSON> = ((T) -> Void)
// 请求回调
typealias FailureCallback<T: HandyJSON> = (ResponseModel<T>) -> Void

// endpoint设置
private let endpointClosure = { (target: TargetType) -> Endpoint in
    var endpoint = Endpoint(
        url: target.baseURL.absoluteString + target.path,
        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers
    )
    // 加入全局header
    return endpoint.adding(newHTTPHeaderFields: commonHeaders)
}

// request设置
private let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        // 设置请求时长
        request.timeoutInterval = requestTimeout
        // 打印请求参数
        if let requestData = request.httpBody {
            print("请求地址: " + "\(String(describing: request.httpMethod!))" + " \(request.url!)" + "\n请求参数: " + "\(String(data: request.httpBody!, encoding: .utf8) ?? "")")
        } else {
            print("请求地址: " + "\(String(describing: request.httpMethod!))" + " \(request.url!)")
        }
        if let header = request.allHTTPHeaderFields {
            print("请求头: \(header)")
        }
        done(.success(request))
    } catch {
        done(.failure(MoyaError.underlying(error, nil)))
    }
}

// 创建网络请求对象，核心初始化方法
fileprivate let ApiProvider = MoyaProvider<MultiTarget>(endpointClosure: endpointClosure, requestClosure: requestClosure, trackInflights: false)

// 网络请求
@discardableResult
func request<T: HandyJSON>(_ target: TargetType,
                           _ modelType: T.Type,
                           _ showFailAlert: Bool = true,
                           _ success: @escaping SuccessCallback<T>,
                           _ failure: FailureCallback<T>? = nil) -> Cancellable? {
    // 判断网络连接
    if !isNetworkConnect() {
        errorHandler("99999", "请检查网络连接", showFailAlert, failure)
        return nil
    }
    
    return ApiProvider.request(MultiTarget(target)) { result in
        switch result {
        case let .success(response):
            // 处理响应体最外层结构
            let jsonString = String(data: response.data, encoding: .utf8)
            guard let model = ResponseModel<T>.deserialize(from: jsonString) else {
                errorHandler("99998", "json解析失败", showFailAlert, failure)
                return
            }
            // 判断状态码
            if model.code == successCode {
                // 如果接口调用成功，则返回数据
                success(model.data!)
            } else {
                errorHandler((model.code)!, (model.message)!, showFailAlert, failure)
                return
            }
        case let .failure(error as NSError):
            errorHandler(String(error.code), "请求失败", showFailAlert, failure)
        }
    }
}

// 错误处理
private func errorHandler<T: HandyJSON>(_ code: String, _ message: String, _ showFailAlert: Bool = true, _ failure: FailureCallback<T>?) {
    var model = ResponseModel<T>()
    model.code = code
    model.message = message
    if showFailAlert {
        print("弹出框显示错误信息: \(message)")
    }
    failure?(model)
}

// 判断网络连接
private func isNetworkConnect() -> Bool {
    let network = NetworkReachabilityManager()
    return network?.isReachable ?? true
}
