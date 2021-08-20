//
//  SmalCustomTableViewCell.swift
//  FacebookMe
//
//  Created by Mac on 2021/08/17.
//

import UIKit

class SmalCustomTableViewCell: UITableViewCell  {
    @IBOutlet weak var custom_Img: UIImageView!
    @IBOutlet weak var custom_Label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
