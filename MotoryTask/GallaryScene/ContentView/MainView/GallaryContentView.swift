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
    private var page:Int = 1
    private var can_page:Bool = false
    private var type:Typo = .all
    
    var onLikeTap:((Int)->Void)?
    var onImageTap:(()->Void)?
    var onFavouriteTap:(()->Void)?
    var onSelectImage:((Int)->Void)?
    var getImages:((Int)->Void)?
    
    var list:[GallaryUIModel] = [] {
        didSet{
            //pagination setup
            if list.count == 0{
                self.can_page = false
            }else{
                self.can_page = true
            }
            if self.can_page {
                self.page += 1
            }
            collectionView.reloadData()
        }
    }

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupUI()
    }
    
    private func setupUI() {
        searchView.layer.cornerRadius = 10
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == collectionView && type == .all {
            if can_page{
                let currentOffset = scrollView.contentOffset.y
                let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
                if (maximumOffset - currentOffset <= 0.0) {
                    self.can_page = false
                    getImages?(page)
                    
                }
            }
        }
    }
    
    @IBAction func imagesAction(_ sender: Any) {
        type = .all
        onImageTap?()
    }
    
    @IBAction func myFavouriteAction(_ sender: Any) {
        type = .favourit
        onFavouriteTap?()
    }
    
}

// CollectionView Delegate
extension GallaryContentView:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GallaryCollectionViewCell = collectionView.dequeueCVCell(indexPath: indexPath)
        cell.gallaryImage.setImageKF(imageLink: list[indexPath.item].url?.thumb)
        cell.descriptionLbl.text = list[indexPath.item].description
        cell.titleLbl.text = list[indexPath.item].altDescription
        cell.onlikeTap = {
            self.onLikeTap?(indexPath.item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.frame.width / 2.2
        
        return CGSize(width: width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelectImage?(indexPath.item)
    }
    
}


