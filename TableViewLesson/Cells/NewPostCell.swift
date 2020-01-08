//
//  NewPostCell.swift
//  TableViewLesson
//
//  Created by Родион Кубышкин on 07/01/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class NewPostCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.layer.cornerRadius = 7
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        userImage.layer.cornerRadius = userImage.frame.height / 2
        selectionStyle = .none
    }
}
