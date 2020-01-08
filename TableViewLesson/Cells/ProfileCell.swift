//
//  ProfileCell.swift
//  TableViewLesson
//
//  Created by Родион Кубышкин on 07/01/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.layer.cornerRadius = userImage.frame.height / 2
        editButton.layer.cornerRadius = editButton.frame.height / 2
        selectionStyle = .none
    }
}
