//
//  ExchangeService.swift
//  ExchangeApp
//
//  Created by rau4o on 10/31/19.
//  Copyright © 2019 rau4o. All rights reserved.
//

import UIKit
import Moya

enum ExchnageService {
    case getExchange
}

extension ExchnageService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.exchangeratesapi.io")!
    }
    
    var path: String {
        switch self {
        case .getExchange:
            return "/latest"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getExchange:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getExchange:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .getExchange:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
    
    
}
