//
//  UIImage + Extention.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 02/05/2024.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImageKF(imageLink:String?){
        guard let imageURL = URL(string: imageLink ?? "") else {return}
        self.kf.indicatorType = .activity
        self.kf.setImage(with: imageURL)
    }
    
}
