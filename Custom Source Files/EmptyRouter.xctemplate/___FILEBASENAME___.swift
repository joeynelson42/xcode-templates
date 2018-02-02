//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import Alamofire

enum ___FILEBASENAME___Endpoint {
    
}

class ___FILEBASENAME___: BaseRouter {
    
    var endpoint: UserEndpoint
    init(endpoint: UserEndpoint) {
        self.endpoint = endpoint
    }
    
    override var method: HTTPMethod {
        switch endpoint {
        
        }
    }
    
    override var path: String {
        switch endpoint {
        
        }
    }
    
    override var parameters: Parameters {
        switch endpoint{
        default: return [:]
        }
    }
    
    override var headers: HTTPHeaders {
        switch endpoint {
        default: return ["Content-Type": "application/json"]
        }
    }
}

// Implement all router related network calls within this extension
extension APIManager {
    
}
