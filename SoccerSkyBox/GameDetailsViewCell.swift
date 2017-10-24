//
//  GameDetailsViewCell.swift
//  test2
//
//  Created by macboy on 7/22/16.
//  Copyright © 2016 XTC. All rights reserved.
//

import UIKit

class GameDetailsViewCell: UITableViewCell {

    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
