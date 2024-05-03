//
//  APIRequest.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 30/04/2024.
//

import Foundation
import Combine


public class APIRequest {
    // fetch data using url session with combine
    func requset(page:Int) -> AnyPublisher<[PhotosResponseModel], NetworkError> {
        let baseURL = URL(string: "https://api.unsplash.com/photos")!
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        components.queryItems = [
            URLQueryItem(name: "page", value:"\(page)"),
            URLQueryItem(name: "client_id", value: AppConstant.accessKey)
        ]
        let url = components.url!
        
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
    
            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { output -> Data in
                    guard output.response is HTTPURLResponse else {
                        throw NetworkError.serverError
                    }
                    return output.data
                }
                .decode(type: [PhotosResponseModel].self, decoder: JSONDecoder())
                .mapError { error in
                    print(error)
                    return NetworkError.unknown
                }
                .eraseToAnyPublisher()

    }
}
