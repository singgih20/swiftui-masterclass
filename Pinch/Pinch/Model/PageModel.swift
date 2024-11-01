//
//  PageModel.swift
//  Pinch
//
//  Created by Singgih Aji Sasongko on 01/11/24.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
