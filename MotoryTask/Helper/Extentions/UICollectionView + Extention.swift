//
//  UICollectionView + Extention.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 01/05/2024.
//

import Foundation
import UIKit

// Generic collectionView delegate
extension UICollectionView {
    func dequeueCVCell<T: UICollectionViewCell>(indexPath:IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not locate viewcontroller with with identifier \(String(describing: T.self)) in storyboard.")
        }
        return cell
    }
    
    func registerCell(id: String) {
        self.register(UINib(nibName: id, bundle: nil), forCellWithReuseIdentifier: id)
    }
    
    func registerCell(id: UICollectionViewCell.Type) {
        let _id = String(describing: id)
        self.register(UINib(nibName: _id, bundle: nil), forCellWithReuseIdentifier: _id)
    }
    static var idinitifer:String{
        return String(describing: self)
    }
    static var nib:UINib{
        return UINib(nibName: self.idinitifer, bundle: nil)
    }
    
}

