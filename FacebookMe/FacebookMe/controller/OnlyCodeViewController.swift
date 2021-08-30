//
//  OnlyCodeViewController.swift
//  FacebookMe
//
//  Created by Mac on 2021/08/25.
//

import UIKit

class OnlyCodeViewController: UIViewController {
    private let sectionHeader: [String] = SectionHeader().shared
    private let myInfo: [Information] = MyInfo().shared
    private let myFavorites: [Information] = MyFavorite().shared
    private let myOptions: [Information] = MyOption().shared
    private let myLogout: [Information] = MyLogout().shared
    
    private let imageView = UIImageView()
    
    lazy var sectionCount : [Int] = [1, myInfo.count, myFavorites.count, myOptions.count, myLogout.count]
    lazy var facebookData: [[Information]] = [
        [Information(label: "", image: "")],
        myInfo,
        myFavorites,
        myOptions,
        myLogout
    ]
    
    private let myTableView: UITableView = UITableView()

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
//            cell.configure()
            // cell의 configure()를 통해 cell안에서 정보를 넣을 수 있다. 즉, 굳이 cell의 변수를 접근할 필요가 없다!
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            showToast(message: "프로필 선택")
        case 1:
            showToast(message: "\(myInfo[indexPath.row].label) 선택")
        case 2:
            showToast(message: "\(myFavorites[indexPath.row].label) 선택")
        case 3:
            showToast(message: "\(myOptions[indexPath.row].label) 선택")
        default:
            showToast(message: "\(myLogout[indexPath.row].label) 선택")
        }
    }
}

extension OnlyCodeViewController {
    // Toast 메시지 띄우는 함수
    func showToast(message : String) {
        let width_variable:CGFloat = 50
        let toastLabel = UILabel(frame: CGRect(x: width_variable, y: self.view.frame.size.height-100, width: view.frame.size.width-2*width_variable, height: 35))
        // 뷰가 위치할 위치를 지정해준다. 여기서는 아래로부터 100만큼 떨어져있고, 너비는 양쪽에 10만큼 여백을 가지며, 높이는 35로
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 8.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
