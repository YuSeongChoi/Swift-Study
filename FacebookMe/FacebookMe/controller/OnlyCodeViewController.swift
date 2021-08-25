//
//  OnlyCodeViewController.swift
//  FacebookMe
//
//  Created by Mac on 2021/08/25.
//

import UIKit

class OnlyCodeViewController: UIViewController {
    let introProfile: Profile = Profile(intro: "최유성", detailIntro: "iOS 개발자입니다.", image: "person.fill")

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        self.navigationItem.title = "Facebook"
        self.navigationController?.navigationBar.barTintColor = .systemBlue
    }
}
