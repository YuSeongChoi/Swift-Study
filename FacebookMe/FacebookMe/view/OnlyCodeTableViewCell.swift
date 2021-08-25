//
//  OnlyCodeTableViewCell.swift
//  FacebookMe
//
//  Created by Mac on 2021/08/26.
//

import UIKit

class OnlyCodeTableViewCell: UITableViewCell {
    // Create ImageView
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "사람"
        return label
    }()
    
    private func setConstant() {
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            myImageView.widthAnchor.constraint(equalToConstant: 64),
            myImageView.heightAnchor.constraint(equalToConstant: 64),
            
            myLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 15),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            myLabel.centerYAnchor.constraint(equalTo: myImageView.centerYAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstant()
    } 
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }

}
