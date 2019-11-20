//
//  NetworkingClient.swift
//  NSUserDefaults
//
//  Created by iHub on 19/11/19.
//  Copyright © 2019 iHubTechnologiesPvtLtd. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingClient: NSObject {
    
    var url: String?
    var methodType: HTTPMethod = .get
    var param: [String: Any]?
    
    static let networkingClient = NetworkingClient()
    
    func excuteServiceCall(url:String, method:String, controller:UIViewController, parameters:Parameters, completion: @escaping (_ result: DataResponse<Any>) -> Void) {
        
        print("URL:\(url)")
        print("Parameters:\(parameters)")
        
        var headers = Alamofire.SessionManager.defaultHTTPHeaders
        headers["HeaderKey"] = "HeaderKey"
        if method == "POST" {
            methodType = .post
            param = parameters
        }
        else {
            methodType = .get
            param = nil
        }
        
        Alamofire.request(url, method: methodType, parameters: param, encoding: JSONEncoding.default, headers:headers
            ).responseJSON{
                response in
                completion(response)
        }
    }
}
