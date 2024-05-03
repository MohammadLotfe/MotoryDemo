//
//  GallaryUseCse.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 02/05/2024.
//

import Foundation
import Combine

protocol GallaryUseCaseProtocol{
    func fetchData(page:Int,completion:@escaping([GallaryUIModel])->Void)async
}

class GallaryUseCase:GallaryUseCaseProtocol {
    private let repository:GallaryRepository
    private var cancellables = Set<AnyCancellable>()
    
    init(repository: GallaryRepository = GallaryRepository()) {
        self.repository = repository
    }
    
}

extension GallaryUseCase {
    // fetch api data from repository
    func fetchData(page:Int,completion: @escaping ([GallaryUIModel]) -> Void)async{
        await repository.callApi(page: page).receive(on:DispatchQueue.main).sink { completion in
            switch completion{
            case .finished:
                print("Api call is finished")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { response in
            
            completion(GallaryUIModel.maptoUIModel(response))
        }
        .store(in: &cancellables)
    }
    
}

