//
//  Service.swift
//  Goldprice
//
//  Created by Nguyen Trong Khoi on 6/11/17.
//  Copyright © 2017 Nguyen Trong Khoi. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON



struct Service {
    
    let tron = TRON(baseURL: NetworkConfig.baseUrl)
    static let shareInstance = Service()
    
    func fetchGoldPrice(completion: @escaping (HomeDatasource?, Error?) -> ()){
        let request: APIRequest<HomeDatasource, JsonError> = tron.request(NetworkConfig.goldpriceEndpoit)
        request.headers = NetworkConfig.appToken
        request.perform(withSuccess: { (homedataSource) in
            completion(homedataSource, nil)
        }) { (err) in
            completion(nil, err)
        }
    }
    
    
    class JsonError : JSONDecodable{
        required init(json: JSON) throws {
            print("Decode JSON ERROR")
        }
    }
}








