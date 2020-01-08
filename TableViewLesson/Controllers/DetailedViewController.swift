//
//  DetailedViewController.swift
//  TableViewLesson
//
//  Created by Родион Кубышкин on 07/01/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class DetailedViewController: UITableViewController {
    
    var post: Posts!
    
    @IBAction func optionButtonDidPressed(_ sender: Any) {
        showOptions()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibPostTableViewCell = UINib(nibName: "PostCell", bundle: nil)
        tableView.register(nibPostTableViewCell, forCellReuseIdentifier: "postCell")
        
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - UIAlertController
    
    func showOptions() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        alert.addAction(UIAlertAction(title: "Редактировать", style: .default) {  (UIAlertAction) in self.performSegue(withIdentifier: "editPostSegue", sender: self)
        })

        alert.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: { (UIAlertAction) in self.showDeleteOptions()
        }))

        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }

    func showDeleteOptions() {
 
        let alert = UIAlertController(title: "Удалить пост?", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: {
            (UIAlertAction) in
            
            Posts.remove(with: self.post.postID)
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction((UIAlertAction(title: "Отмена", style: .cancel, handler: nil)))
        
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCell
        cell.configureCell(for: post)
        cell.customTextLabel.numberOfLines = .max
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? EditController {
            destinationViewController.delegate = self
            destinationViewController.post = post
        }
    }
}

// MARK: - Extension
extension DetailedViewController: dataPassingDelegate{
    
    func changeText(for post: Posts) {
        self.post = post
        Posts.changePost(with: post.postID, newPost: post)
        tableView.reloadData()
    }
}
