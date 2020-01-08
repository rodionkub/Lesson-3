//
//  PostCell.swift
//  TableViewLesson
//
//  Created by Родион Кубышкин on 07/01/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var customTextLabel: UILabel!
    @IBOutlet weak var customImageView: UIImageView!
    
    func configureCell(for posts: Posts){
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        selectionStyle = .none
        customTextLabel.text = posts.postText
        customImageView.image = posts.postImage
    }
}
