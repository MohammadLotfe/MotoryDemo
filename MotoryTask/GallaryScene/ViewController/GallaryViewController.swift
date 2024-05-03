//
//  GallaryViewController.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 01/05/2024.
//

import UIKit
import Combine
class GallaryViewController: UIViewController {
    
    private var contentView:GallaryContentView!
    private var viewModel:GallaryViewModel = .init(useCase: GallaryUseCase.init())
    private var cancellables = Set<AnyCancellable>()
    private var list:[GallaryUIModel] = []
    private var page:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConentView()
        bindingUI()
        bindingAPI()
        viewModel.getImages(page: page)
    }
    
    private func setupConentView() {
        contentView = .fromNib()
        contentView.frame = self.view.bounds
        self.view.addSubview(contentView)
    }
    
    private func bindingUI() {
        // like action
        contentView.onLikeTap = { [weak self] index in
            guard let self = self else {return}
            self.list[index].isLiked = !self .list[index].isLiked
        }
        // on select images category
        contentView.onImageTap = {[weak self] in
            guard let self = self else {return}
            self.contentView.list = self.list
        }
        // on select favourite category
        contentView.onFavouriteTap = { [weak self] in
            guard let self = self else {return}
            self.contentView.list = []
            self.contentView.list = self.list.filter({$0.isLiked == true})
        }
        // get pagination data
        contentView.getImages = { [weak self] page in
            guard let self = self else {return}
            self.viewModel.getImages(page: page)
            self.page = page
        }
        // open image viewer
        contentView.onSelectImage = { [weak self] index in
            let selectedImage:String = self?.list[index].url?.full ?? ""
            guard let ViewController = self?.viewModel.openViewer(urlImage:selectedImage) else {return}
            ViewController.modalPresentationStyle = .fullScreen
            self?.present(ViewController, animated: true)
        }
    }
    
    // observing api data 
    private func bindingAPI() {
        viewModel.$gallaryResponse.sink(receiveValue: { [weak self] response in
            guard let self = self else {return}
            self.contentView.list += response ?? []
            self.list += response ?? []
        }).store(in: &cancellables)
    }

}


