//
//  SectionHeaders.swift
//  FacebookMe
//
//  Created by Mac on 2021/08/26.
//

import Foundation

struct SectionHeader {
    let shared : [String] = [" "," ","FAVORITES"," "," "]
}

struct MyInfo {
    let shared: [Information] = [
        Information(label: "Friends", image: "img"),
        Information(label: "Events", image: "img"),
        Information(label: "Groups", image: "img"),
        Information(label: "CNU", image: "img"),
        Information(label: "Town Hall", image: "img"),
        Information(label: "Instant Games", image: "img")
    ]
}

struct MyFavorite {
    let shared: [Information] = [
        Information(label: "muck bang", image: "img"),
        Information(label: "K-pop", image: "img"),
    ]
}

struct MyOption {
    let shared: [Information] = [
        Information(label: "Settings", image: "img"),
        Information(label: "Privacy Shortcuts", image: "img"),
        Information(label: "Help and Support", image: "img")
    ]
}
