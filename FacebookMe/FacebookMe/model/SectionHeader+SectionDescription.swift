//
//  SectionHeader+SectionDescription.swift
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
        Information(label: "Friends", image: "person.2.fill"),
        Information(label: "Events", image: "calendar"),
        Information(label: "Groups", image: "person.3.fill"),
        Information(label: "CNU", image: "graduationcap"),
        Information(label: "Town Hall", image: "house.fill"),
        Information(label: "Instant Games", image: "gamecontroller.fill"),
        Information(label: "See More...", image: "")
    ]
}

struct MyFavorite {
    let shared: [Information] = [
        Information(label: "muck bang", image: "img"),
        Information(label: "K-pop", image: "img"),
        Information(label: "Add Favorites...", image: "img")
    ]
}

struct MyOption {
    let shared: [Information] = [
        Information(label: "Settings", image: "gearshape.fill"),
        Information(label: "Privacy Shortcuts", image: "shield.lefthalf.fill"),
        Information(label: "Help and Support", image: "questionmark")
    ]
}

struct MyLogout {
    let shared: [Information] = [
        Information(label: "Log out", image: "")
    ]
}
