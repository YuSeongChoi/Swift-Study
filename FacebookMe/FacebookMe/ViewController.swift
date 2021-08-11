//
//  ViewController.swift
//  FacebookMe
//
//  Created by Mac on 2021/08/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let cellName: String = "customCell"
    let cellTitle: [String] = ["pencil.circle","doc.circle","bolt.circle"]
     
    let data = [
        ["최유성\n iOS 개발자 입니다."],
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CustomCell
        
        cell.custom_Label.text = data[indexPath.section][indexPath.row]
        cell.custom_Img.image = UIImage(systemName: img[indexPath.section][indexPath.row])
        
        if cell.custom_Label.text == "Log out" {
            cell.custom_Label.textColor = .systemRed
        }
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

