//
//  PhotoResponseModel.swift
//  MotoryTask
//
//  Created by Mohammad nedal  on 30/04/2024.
//

import Foundation

// MARK: - PhotosResponseModelElement
struct PhotosResponseModel: Codable {
    var description: String?
    var altDescription: String?
    var urls: Urls?

    enum CodingKeys: String, CodingKey {
        case description
        case altDescription
        case urls
    }
}

// MARK: - Urls
struct Urls: Codable {
    var raw, full, regular, small: String?
    var thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3
    }
}

