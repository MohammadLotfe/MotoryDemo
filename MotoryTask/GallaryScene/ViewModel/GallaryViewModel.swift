//
//  GallaryViewModel.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 01/05/2024.
//

import Foundation
import Combine

class GallaryViewModel:Observable {
 
    private var useCase:GallaryUseCaseProtocol
    @Published var gallaryResponse:[GallaryUIModel]?

    
    init(useCase: GallaryUseCaseProtocol) {
        self.useCase = useCase
    }
    // fetch api data from use case
    func getImages(page:Int){
        Task.init {
            await useCase.fetchData(page:page, completion: {[weak self] response in
                self?.gallaryResponse = response
            })
        }
    }
}

//Router
extension GallaryViewModel {
    func openViewer(urlImage:String) -> ViewerViewController{
        let viewer:ViewerViewController = .init(urlImage: urlImage)
        return viewer
    }
}


