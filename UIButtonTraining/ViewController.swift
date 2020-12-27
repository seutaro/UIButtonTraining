//
//  ViewController.swift
//  UIButtonTraining
//
//  Created by shotaro takahashi on 2020/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    let addButtonImage = UIImage(named: "addButton")
    let deleteButtonImage = UIImage(named: "deleteButton")
    let tweetButtonImage = UIImage(named: "TweetButton")
    
    @IBOutlet weak var manuButton: UIButton!
    
    let customButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customButton.manuButton = self.manuButton
        customButton.manuPosition = self.manuButton.layer.position
        
        customButton.addButton.setImage(addButtonImage, for: .normal)
        customButton.deleteButton.setImage(deleteButtonImage, for: .normal)
        customButton.tweetButton.setImage(tweetButtonImage, for: .normal)
        
        self.manuButton.addTarget(customButton, action: #selector(customButton.movementWhenManuButtonTapped), for: .touchUpInside)
        self.view.addSubview(customButton)
        
    }
}
