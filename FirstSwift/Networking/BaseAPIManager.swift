//
//  BaseAPIManager.swift
//  FirstSwift
//
//  Created by TCOM on 09/09/2023.
//

import Foundation
import Moya
/**
 Public protocol that defines the minimum API that a ServiceManager should expose.
 
 The ServiceManager is the component in charge of handling al network request for
 an specific TargetType.
 
 Basic behaviour implemented using RxSwift is provided by the BaseManager class.
 */
public protocol ServiceManager {
    /// The associated TargetType of the Manager.
    associatedtype ProviderType: TargetType
    /// The MoyaProvider instance used to make the network requests.
    var provider: MoyaProvider<ProviderType> { get }
    /// The JSON decoding strategy used for JSON Responses.
    var jsonDecoder: JSONDecoder { get }
}

/**
 Base Manager class that implements generic behaviour to
 be extendended and used by subclassing it.
 
 The base manager has an associated TargetType, this means
 that you should have **one and only one** manager for each TargetType.
 
 This base implementation provides helpers to make requests using RxSwift
 with automatic encoding if you provide a propper model as the expected result type.
 */
open class BaseManager<T>: ServiceManager where T: TargetType {
    public typealias ProviderType = T
    
    private var sharedProvider: MoyaProvider<T>!
    
    public required init() {}
    
    /**
     Default provider implementation as a singleton. It provides networking
     loggin out of the box and you can override it if you want to add more middleware.
     */
    open var provider: MoyaProvider<T> {
        guard let provider = sharedProvider else {
            if Constanst.buildEnv == .Develop {
                self.sharedProvider = MoyaProvider<T>(
                    plugins: [
                        NetworkLoggerPlugin(configuration: .init(formatter: .init(), output: { (target, array) in
                            if let log = array.first {
                                debugPrint(log)
                            }
                        }, logOptions: .formatRequestAscURL))
                    ]
                )
            } else {
                self.sharedProvider = MoyaProvider<T>(
                    plugins: [
                        NetworkLoggerPlugin(configuration: .init(formatter: .init(), output: { (target, array) in
                            if let log = array.first {
                                debugPrint(log)
                            }
                        }, logOptions: .formatRequestAscURL))
                    ]
                )
            }
            return sharedProvider
        }
        return provider
    }
    
    /**
     Default JSON decoder setup, uses the most common case of keyDecoding,
     converting from camel_case to snakeCase before attempting to match
     override this var if you need to customize your JSON decoder.
     */
    open var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    /**
     Makes a request to the provided target and tries to decode its response
     using the provided keyPath and return type and returning it as an Observable.
     - Parameters:
     - target: The TargetType used to make the request.
     - keyPath: The keypath used to decode from JSON (if passed nil, it will try to decode from the root).
     */
    //    @discardableResult
    //    open func request(_ target: T,
    //                      callbackQueue: DispatchQueue? = .none,
    //                      progress: ProgressBlock? = .none,
    //                      completion: @escaping Completion) -> Cancellable? {
    //        if !isNetworkConnected() {
    //            if let data = "{\"signal\": -111,\"errorCode\": \"ERR_NO_INTERNET\",\"message\": \"You are not connect to internet\"}".data(using: .utf8) {
    //                completion(.success(Response.init(statusCode: 200, data: data)))
    //            } else {
    //                completion(.success(Response.init(statusCode: 200, data: Data())))
    //            }
    //            return nil
    //        }
    //        return provider.request(target, callbackQueue: callbackQueue, progress: progress, completion: completion)
    //    }
    
    /**
     Makes a request to the provided target and tries to decode its response
     using the provided keyPath and return type and returning it as an Observable.
     - Parameters:
     - target: The TargetType used to make the request.
     - keyPath: The keypath used to decode from JSON (if passed nil, it will try to decode from the root).
     */
    //    open func request<T>(_ target: ProviderType, at keyPath: String? = nil) -> Observable<T> where T: Codable {
    //        return provider.rx.request(target)
    //            .filterSuccessfulStatusCodes()
    //            .map(T.self, atKeyPath: keyPath, using: jsonDecoder)
    //            .asObservable()
    //    }
    
    /// Helper to use as middleware to pretty print the JSON response.
    private func JSONResponseDataFormatter(_ data: Data) -> Data {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return prettyData
        } catch {
            return data
        }
    }
    
    func JSONResponseDataFormatter2(_ data: Data) -> String {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
        } catch {
            return String(data: data, encoding: .utf8) ?? ""
        }
    }
    
    func requestAPI<RMD>(_ target: T,
                         type: RMD.Type,
                         onSuccess: @escaping ((_ response: RMD) -> Void),
                         onFailed: @escaping ((_ error: BaseError?) -> Void)) where RMD : Codable {
        provider.request(target) { response in
            switch response {
            case let .success(moyaResponse):
                do {
                    let result = try JSONDecoder().decode(type, from: moyaResponse.data)
                    onSuccess(result)
                } catch {
                    onFailed(nil)
                }
            case let .failure(error):
                do {
                    let result = try JSONDecoder().decode(BaseError.self, from: error.response?.data ?? Data())
                    onFailed(result)
                } catch {
                    onFailed(nil)
                }
            }
        }
    }
    
}

