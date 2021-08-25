//
//  CodeProfileTableViewCell.swift
//  FacebookMe
//
//  Created by Mac on 2021/08/26.
//

import UIKit

class CodeProfileTableViewCell: UITableViewCell {
    // 이미지 뷰 생성
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        return imageView
    }()
    
    // 윗중 라벨 생성
    private let upLabel: UILabel = {
        let label = UILabel()
        label.text = "최유성"
        return label
    }()
    
    // 아랫줄 라벨 생성
    private let downLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS 개발자입니다."
        return label
    }()
    
    private func setConstant() {
        contentView.addSubview(myImageView)
        contentView.addSubview(upLabel)
        contentView.addSubview(downLabel)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        upLabel.translatesAutoresizingMaskIntoConstraints = false
        downLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            myImageView.widthAnchor.constraint(equalToConstant: 64),
            myImageView.heightAnchor.constraint(equalToConstant: 64),
            
            upLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 15),
            upLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            upLabel.centerYAnchor.constraint(equalTo: myImageView.centerYAnchor, constant: -10),
            
            downLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 15),
            downLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            downLabel.centerYAnchor.constraint(equalTo: myImageView.centerYAnchor, constant: 10)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstant()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
