//
//  TableViewController.swift
//  TableViewLesson
//
//  Created by Родион Кубышкин on 07/01/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var posts: [Posts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userCell = UINib.init(nibName: "ProfileCell", bundle: nil)
        tableView.register(userCell, forCellReuseIdentifier: "profileCell")
        
        let newPostCell = UINib.init(nibName: "NewPostCell", bundle: nil)
        tableView.register(newPostCell, forCellReuseIdentifier: "newPostCell")
        
        let postCell = UINib.init(nibName: "PostCell", bundle: nil)
        tableView.register(postCell, forCellReuseIdentifier: "postCell")
        
        Posts.generatePosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        posts = Posts.postsArray
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
            case 2:
                return posts.count
            default:
                return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
            case 0:
                return 158
            case 1:
                return 63
            default:
                return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
           switch section {
               case 0:
                   return 10
               case 1:
                   return 10
               default:
                   return 0
            }
       }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileCell
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "newPostCell", for: indexPath) as! NewPostCell
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCell
                cell.configureCell(for: posts[indexPath.row])
                return cell
            default:
                return UITableViewCell()
        }
    }

    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? DetailedViewController{
            destinationViewController.post = sender as? Posts
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 2 {
            performSegue(withIdentifier: "detailedPostSegue", sender: posts[indexPath.row])
        }
    }
}
