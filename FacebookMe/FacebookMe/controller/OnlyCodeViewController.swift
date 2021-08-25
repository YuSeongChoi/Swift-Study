//
//  OnlyCodeViewController.swift
//  FacebookMe
//
//  Created by Mac on 2021/08/25.
//

import UIKit

class OnlyCodeViewController: UIViewController {
    let sectionHeader: [String] = SectionHeader().shared
    let myInfo: [Information] = MyInfo().shared
    let myFavorites: [Information] = MyFavorite().shared
    let myOptions: [Information] = MyOption().shared
    let myLogout: [Information] = MyLogout().shared
    
    lazy var sectionCount : [Int] = [1, myInfo.count, myFavorites.count, myOptions.count, myLogout.count]
    lazy var facebookData: [[Information]] = [
        [Information(label: "", image: "")],
        myInfo,
        myFavorites,
        myOptions,
        myLogout
    ]
    
    let myTableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        self.myTableView.dataSource = self
        self.myTableView.delegate = self

        setConstraint()
        setCell()
        
        self.navigationItem.title = "Facebook"
        self.navigationController?.navigationBar.barTintColor = .systemBlue
    }
    
    private func setCell() {
        myTableView.register(CodeProfileTableViewCell.self, forCellReuseIdentifier: "profileCell")
        myTableView.register(OnlyCodeTableViewCell.self, forCellReuseIdentifier: "infoCell")
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
    // 총 섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeader.count
    }
    
    // 헤더 높이
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    // 헤더 타이틀
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeader[section]
    }
    
    // 각 섹션의 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionCount[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath[0] == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as? CodeProfileTableViewCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell =  tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? OnlyCodeTableViewCell else { return UITableViewCell() }
            cell.myLabel.text = facebookData[indexPath.section][indexPath.row].label
            cell.myImageView.image = UIImage(systemName: facebookData[indexPath.section][indexPath.row].image)
            cell.accessoryType = .none
            checkColor(cell: cell)
            return cell
        }
    }
    
    // 색깔 표시해주는 부분
    func checkColor(cell: OnlyCodeTableViewCell) {
        if cell.myLabel.text == "See More..." || cell.myLabel.text == "Add Favorites..." {
            cell.accessoryType = .none
            cell.myLabel.textColor = .systemBlue
        }
        
        else if cell.myLabel.text == "Log out" {
            cell.accessoryType = .none
            cell.myLabel.textColor = .systemRed
        }
        
        else {
            cell.accessoryType = .disclosureIndicator
            cell.myLabel.textColor = .black
        }
    }
    
    
}

extension OnlyCodeViewController: UITableViewDelegate {
    
}
