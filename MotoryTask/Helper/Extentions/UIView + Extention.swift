//
//  UIView + Extention.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 01/05/2024.
//

import Foundation
import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
