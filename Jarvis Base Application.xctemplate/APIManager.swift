//
//  APIManager.swift
//


import Foundation
import Alamofire
import Unbox

/**
 Manages all network requests and implements the our Router architecture.
 Steps for making a request:
 1. Create model-specific router.
 2. Make request through Alamofire using the router.
 3. Implement a completion block to use the request results (if any).
 4. Handle any errors (if any).
 */
struct APIManager {
    
    // MARK: Properties
    static let shared = APIManager()
    
    // MARK: Initializers
    init() {}
    
    // MARK: Methods
    
    //Here is an example GET request
//    func getUsers(completion: @escaping (_ users: [User]) -> Void) {
//        let router = UserRouter(endpoint: .GetUsers)
//        Alamofire.request(router.fullPath, headers: router.fullHeaders).responseJSON { response in
//            do{
//                guard let jsonData = response.data else {return}
//                let users: [User] = try unbox(data: jsonData)
//                completion(users)
//            }catch{
//                print("Unable to read JSON, no profile exists\n \(error.localizedDescription)")
//            }
//        }
//    }
}

