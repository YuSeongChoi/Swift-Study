//
//  OnlyCodeViewController.swift
//  FacebookMe
//
//  Created by Mac on 2021/08/25.
//

import UIKit

class OnlyCodeViewController: UIViewController {
    let introProfile: Profile = Profile(intro: "최유성", detailIntro: "iOS 개발자입니다.", image: "person.fill")
    let sectionHeader: SectionHeader = SectionHeader()
    let myInfo: [Information] = MyInfo().shared
    let myFavorites: [Information] = MyFavorite().shared
    let myOptions: [Information] = MyOption().shared
    
    let myTableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        myTableView.register(OnlyCodeTableViewCell.self, forCellReuseIdentifier: "cell")
        setConstraint()
        
        self.navigationItem.title = "Facebook"
        self.navigationController?.navigationBar.barTintColor = .systemBlue
    }
    
    private func setConstraint() {
        self.view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            myTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            myTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension OnlyCodeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? OnlyCodeTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}

extension OnlyCodeViewController: UITableViewDelegate {
    
}
