//
//  DetailViewController.swift
//  MemeMe V2.0
//
//  Created by NISHANTH NAGELLA on 4/26/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    var meme : Meme!
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var textLabel : UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageView.image = meme.memedImage
        self.textLabel.text = meme.topText + "..." + meme.bottomText
        self.tabBarController?.tabBar.isHidden = true
    }
}
