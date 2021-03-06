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
    // ??? ?????? ??????
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeader.count
    }
    
    // ?????? ??????
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    // ?????? ?????????
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeader[section]
    }
    
    // ??? ????????? ??? ??????
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
            // cell??? configure()??? ?????? cell????????? ????????? ?????? ??? ??????. ???, ?????? cell??? ????????? ????????? ????????? ??????!
            cell.myLabel.text = facebookData[indexPath.section][indexPath.row].label
            cell.myImageView.image = UIImage(systemName: facebookData[indexPath.section][indexPath.row].image)
            cell.accessoryType = .none
            checkColor(cell: cell)
            return cell
        }
    }
    
    // ?????? ??????????????? ??????
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
            showToast(message: "????????? ??????")
        case 1:
            showToast(message: "\(myInfo[indexPath.row].label) ??????")
        case 2:
            showToast(message: "\(myFavorites[indexPath.row].label) ??????")
        case 3:
            showToast(message: "\(myOptions[indexPath.row].label) ??????")
        default:
            showToast(message: "\(myLogout[indexPath.row].label) ??????")
        }
    }
}

extension OnlyCodeViewController {
    // Toast ????????? ????????? ??????
    func showToast(message : String) {
        let width_variable:CGFloat = 50
        let toastLabel = UILabel(frame: CGRect(x: width_variable, y: self.view.frame.size.height-100, width: view.frame.size.width-2*width_variable, height: 35))
        // ?????? ????????? ????????? ???????????????. ???????????? ??????????????? 100?????? ???????????????, ????????? ????????? 10?????? ????????? ?????????, ????????? 35???
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
