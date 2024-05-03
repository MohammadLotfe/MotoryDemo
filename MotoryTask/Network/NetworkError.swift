//
//  NetworkError.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 30/04/2024.
//

import Foundation

public enum NetworkError:Error,Equatable{
    case noInterNetConnection
    case serverError
    case unknown
    
    var description:String {
        switch self {
        case .noInterNetConnection:
            return "No internet connection"
        case .serverError:
            return "Internal server error"
        case .unknown:
           return "somthing wrong"
        }
    }
}
