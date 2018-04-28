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
    var index : Int!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        meme = appdelegate.memes[index]
        self.imageView.image = meme.memedImage
        self.textLabel.text = meme.topText + "..." + meme.bottomText
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(DetailViewController.callMemeEditor))
    }
    
    
    
    @objc func callMemeEditor(){  
      let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
        if (viewController.view != nil){
            viewController.topText.text = meme.topText
            viewController.bottomText.text = meme.bottomText
            viewController.pickerImageView.image = meme.originalImage
            viewController.index = index
            viewController.shareButton.isEnabled = true
        }
            present(viewController, animated: true, completion: nil)

    }
    
    
    
}
