//
//  GallaryRepository.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 02/05/2024.
//

import Foundation
import Combine


protocol GallaryRepositoryProtocol {
    func callApi()async -> AnyPublisher<[PhotosResponseModel],NetworkError>
}

class GallaryRepository:GallaryRepositoryProtocol {
    
    func callApi()async -> AnyPublisher<[PhotosResponseModel], NetworkError> {
        return APIRequest().requset()
    }
}
