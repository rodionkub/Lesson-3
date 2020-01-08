//
//  EditController.swift
//  TableViewLesson
//
//  Created by Родион Кубышкин on 07/01/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class EditController: UIViewController {

    @IBOutlet weak var postTextView: UITextView!
    
    var post: Posts!
    var delegate: dataPassingDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTextView.text = post.postText
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func readyButtonPressed(_ sender: Any) {
        post.postText = postTextView.text
        delegate.changeText(for: post)
        dismiss(animated: true, completion: nil)
    }
}

protocol dataPassingDelegate {
    
    func changeText(for post: Posts)
}
