//
//  NetworkEnvironment.swift
//  iOSDemoApp
//
//  Created by Alejandro Castillo on 28/03/2022.
//

import Foundation

enum NetworkEnvironment {
    case prod
    case dev
    
    var currentEnvironment: String {
        switch self {
        case .prod:
            return "prod"
        case .dev:
            return "dev"
        }
    }
    
    #if DEBUG
    static var currentEnvironment: NetworkEnvironment { .dev }
    #else
    static var currentEnvironment: NetworkEnvironment { .prod }
    #endif
}
