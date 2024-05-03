//
//  ViewerViewController.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 02/05/2024.
//

import UIKit

class ViewerViewController: UIViewController {
    
    private var contentView:ViewerContentView!
    private var urlImage:String?
    
    init(urlImage: String) {
        super.init(nibName: nil, bundle: nil)
        self.urlImage = urlImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindingUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentView.urlImage = self.urlImage ?? ""
    }
    // add Viewer view to the controller
    private func setupView() {
        contentView = .fromNib()
        contentView.frame = self.view.bounds
        self.view.addSubview(contentView)
    }
    // observing actions
    private func bindingUI() {
        contentView.onDismissTap = {
            self.dismiss(animated: true)
        }
    }

}
