//
//  ViewerContentView.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 02/05/2024.
//

import UIKit

class ViewerContentView: UIView {

    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var imageGallary: UIImageView!
    @IBOutlet weak var dismissBtn: UIButton!
    
    var urlImage:String = "" {
        didSet{
            imageGallary.setImageKF(imageLink: urlImage)
        }
    }
    
    var onDismissTap:(()->Void)?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        onDismissTap?()
    }
    
}

extension ViewerContentView :UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageGallary
    }
}
