//
//  GallaryUIModel.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 02/05/2024.
//

import Foundation


struct GallaryUIModel {
    var description:String?
    var altDescription:String?
    var url:Urls?
    var isLiked:Bool = false
}

extension GallaryUIModel {
    static func maptoUIModel(_ response:[PhotosResponseModel])-> [Self] {
        var list:[GallaryUIModel] = []
        response.forEach({ obj in
            list.append(GallaryUIModel(description:obj.description, altDescription: obj.altDescription,url: obj.urls, isLiked: false))
        })
        return list
    }
    
}
