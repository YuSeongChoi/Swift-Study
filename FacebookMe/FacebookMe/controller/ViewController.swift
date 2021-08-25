//
//  ViewController.swift
//  FacebookMe
//
//  Created by Mac on 2021/08/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let smallCellName: String = "small"
    private let bigCellName: String = "big"
    private let cellTitle: [String] = ["pencil.circle","doc.circle","bolt.circle"]
     
    let data = [
        ["최유성\niOS 개발자 입니다."],
        ["Friends","Events","Groups","SSU","Town Hall","Instant Games","See More..."],
        ["Youtube","LOL","Starcraft","Hip-Hop","Add Favorites..."],
        ["Settings","Privacy Shortcuts","Help and Support"],
        ["Log out"]
    ]
    
    let img = [
        ["person.2.fill"],
        ["person.2.fill","calendar","person.3.fill","graduationcap","house.fill","gamecontroller.fill",""],
        ["","","","",""],
        ["gearshape.fill","shield.lefthalf.fill","questionmark"],
        [""]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Facebook"
        self.navigationController?.navigationBar.barTintColor = .blue
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    // 헤더 높이
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    // 헤더 타이틀
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 2 {
            return "FAVORTIES"
        } else {
            return ""
        }
    }
    
    // 셀 보여주는 부분
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: bigCellName, for: indexPath) as! BigCustomTableViewCell
//            cell.configuration()
            cell.custom_Label.text = data[indexPath.section][indexPath.row]
            cell.custom_Img.image = UIImage(systemName: "person.fill")
            cell.accessoryType = .none
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: smallCellName, for: indexPath) as! SmalCustomTableViewCell
            cell.custom_Label.text = data[indexPath.section][indexPath.row]
            cell.custom_Img.image = UIImage(systemName: img[indexPath.section][indexPath.row])
            
            checkColor(cell: cell)
            
            return cell
        }
    }
    
    // 색깔 표시해주는 부분
    func checkColor(cell: SmalCustomTableViewCell) {
        if cell.custom_Label.text == "See More..." || cell.custom_Label.text == "Add Favorites..." {
            cell.accessoryType = .none
            cell.custom_Label.textColor = .systemBlue
        }
        
        else if cell.custom_Label.text == "Log out" {
            cell.accessoryType = .none
            cell.custom_Label.textColor = .systemRed
        }
        
        else {
            cell.accessoryType = .disclosureIndicator
            cell.custom_Label.textColor = .black
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("section : \(indexPath.section), indexPath : \(indexPath.row), data section : \(data[indexPath.section].count)")
    }
}

