//
//  BaseRouter.swift
//

import Foundation
import Alamofire

public typealias JSONDictionary = [String: AnyObject]
typealias RequestHeader = [String : String]?

/// Routers must conform to this protocol otherwise the APIManager won't allow their use.
protocol APIConfigured {
    var method: String { get }
    var path: String { get }
    var headers: HTTPHeaders { get }
    var baseUrl: String { get }
}

/**
 The BaseRouter is the superclass of our network routers.
 It should never be used explicitly, only inherited from.
 Any subclasses should ovverride the APIConfigured Protocol elements.
 */
class BaseRouter: APIConfigured {
    
    init() {}
    let useError = "Override BaseRouter with a subclass."
    
    var method: String {
        fatalError(useError)
    }
    
    var path: String {
        fatalError(useError)
    }
    
    var headers: HTTPHeaders {
        fatalError(useError)
    }
    
    var baseUrl: String {
        return ""
//        return Constants.baseURL
    }
    
    /// headers that all requests include
    var baseHeaders: HTTPHeaders {
        return [ "Accept": "application/json" ]
    }
    
    /// A string combining the baseUrl and the request's specific path
    var fullPath: String {
        return "\(baseUrl)\(path)"
    }
    
    /// A dictionary containing both the baseHeaders and the request's specific headers.
    var fullHeaders: HTTPHeaders {
        var combined = baseHeaders
        for (key, value) in headers {
            combined[key] = value
        }
        return combined
    }
}
