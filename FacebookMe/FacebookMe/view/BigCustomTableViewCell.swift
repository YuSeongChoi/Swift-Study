//
//  BigCustomTableViewCell.swift
//  FacebookMe
//
//  Created by Mac on 2021/08/13.
//

import UIKit

class BigCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var custom_Img: UIImageView!
    @IBOutlet weak var custom_Label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
