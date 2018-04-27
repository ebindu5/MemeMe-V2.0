//
//  SentMemesViewController.swift
//  MemeMe V2.0
//
//  Created by NISHANTH NAGELLA on 4/26/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

class SentMemesViewController: UITableViewController{
    var memes = [Meme]()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        tableView.reloadData()
        tableView.rowHeight = self.view.frame.height / 10.0
        self.navigationItem.title = "Sent Memes"
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell", for: indexPath)
        let meme = memes[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = meme.topText + "..." + meme.bottomText
        cell.imageView?.image = meme.memedImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meme = memes[(indexPath as NSIndexPath).row]
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        viewController.meme = meme
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
