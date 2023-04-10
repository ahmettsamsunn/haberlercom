//
//  habermodel.swift
//  haberler
//
//  Created by Ahmet Samsun on 31.03.2023.
//

import Foundation
struct Haberler : Codable {
    let news : [News]
}
struct News : Codable {
    var title : String
    var category : String
    var imageUrl : String
    var webUrl : String
    var spot : String
    var videoUrl : String
    
}
