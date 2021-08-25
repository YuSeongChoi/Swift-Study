//
//  Information.swift
//  FacebookMe
//
//  Created by Mac on 2021/08/26.
//

import Foundation

struct Profile {
    let intro: String
    let detailIntro: String
    let image: String
    
    init(intro: String, detailIntro: String, image: String) {
        self.intro = intro
        self.detailIntro = detailIntro
        self.image = image
    }
}

struct Information {
    let label: String
    let image: String
    
    init(label: String, image: String) {
        self.label = label
        self.image = image
    }
}
