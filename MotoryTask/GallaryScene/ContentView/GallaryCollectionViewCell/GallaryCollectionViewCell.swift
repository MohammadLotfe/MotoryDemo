//
//  GallaryCollectionViewCell.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 01/05/2024.
//

import UIKit

class GallaryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var gallaryImage: UIImageView!
    @IBOutlet weak var likeBtn: UIButton!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    private var likeStatus:Bool = false
    var onlikeTap:(()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    @IBAction func likeAction(_ sender: Any) {
        likeStatus = !likeStatus
        likeBtn.setImage(UIImage(named: likeStatus ? "ic_like" : "ic_dislike"), for: .normal)
        onlikeTap?()
    }
}
