//
//  Photo.swift
//  Snacktacular
//
//  Created by mayidan on 4/17/20.
//  Copyright © 2020 John Gallaugher. All rights reserved.
//

import Foundation
import Firebase


class Photo {
    var image: UIImage
    var description: String
    var postedBy: String
    var date: Date
    var documentUUID: String // Universal Unique Identifier
    
    init(image: UIImage, description: String, postedBy: String, date: Date, documentUUID: String) {
        self.image = image
        self.description = description
        self.postedBy = postedBy
        self.date = date
        self.documentUUID = documentUUID
    }
}
