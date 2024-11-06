//
//  VideoModel.swift
//  Africa
//
//  Created by Singgih Aji Sasongko on 06/11/24.
//

import Foundation

struct Video: Identifiable, Codable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
