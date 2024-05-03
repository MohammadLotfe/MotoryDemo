//
//  GallaryContentView.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 30/04/2024.
//

import Foundation
import UIKit

class GallaryContentView:UIView {
    
    @IBOutlet weak var searchLbl: UILabel!
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTXF: UITextField!
    
    @IBOutlet weak var imagesBtn: UIButton!
    @IBOutlet weak var myFavouriteBtn: UIButton!
    
    @IBOutlet weak var resultLbl: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.registerCell(id: GallaryCollectionViewCell.self)
        }
    }
    
    var list:[GallaryUIModel] = [] {
        didSet{
            print("list:\(list.count)")
            collectionView.reloadData()
        }
    }

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
    
    private func setupUI() {
        searchView.layer.cornerRadius = 10
    }
    
}


extension GallaryContentView:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var imagUrl = list[indexPath.item].url?.regular
        
        let cell:GallaryCollectionViewCell = collectionView.dequeueCVCell(indexPath: indexPath)
        cell.gallaryImage.setImageKF(imageLink: imagUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.frame.width / 2.2
        
        return CGSize(width: width, height: 250)
    }
    
}
