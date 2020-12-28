//
//  ViewController.swift
//  UIButtonTraining
//
//  Created by shotaro takahashi on 2020/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var manuButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var tweetButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    private var isTapped: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButton()
        
    }
    
    func setUpButton() {
        manuButton.addTarget(self, action: #selector(self.movementWhenManuButtonTapped(_:)), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(self.movementWhenCloseButtonTapped(_:)), for: .touchUpInside)
        tweetButton.addTarget(self, action: #selector(self.tweetButtonAction), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(self.addButtonTapped), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(self.deleteButtonTapped), for: .touchUpInside)
    }
    
    func getButtonPosition(angle: CGFloat, radius: CGFloat) -> CGPoint {
        let radian = angle * .pi / 180
        
        let positionX = manuButton.layer.position.x + cos(radian) * radius
        let positionY = manuButton.layer.position.y + sin(radian) * radius
        
        let position = CGPoint(x: positionX, y: positionY)
        
        return position
    }
    
    @objc func movementWhenManuButtonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.manuButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        })
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.manuButton.transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
            self.addButton.layer.position = self.getButtonPosition(angle: -90, radius: 200)
            self.deleteButton.layer.position = self.getButtonPosition(angle: -180, radius: 200)
            self.tweetButton.layer.position = self.getButtonPosition(angle: -135, radius: 200)
        }, completion: {_ in
            self.closeButton.isHidden = false
            self.addButton.isHidden = false
            self.tweetButton.isHidden = false
            self.deleteButton.isHidden = false
            self.manuButton.isHidden = true
        })
    }
    
    @objc func movementWhenCloseButtonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.closeButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        })
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.closeButton.transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
            self.addButton.layer.position = self.manuButton.layer.position
            self.deleteButton.layer.position = self.manuButton.layer.position
            self.tweetButton.layer.position = self.manuButton.layer.position
        }, completion: {_ in
            self.addButton.isHidden = true
            self.tweetButton.isHidden = true
            self.deleteButton.isHidden = true
            self.closeButton.isHidden = true
            self.manuButton.isHidden = false
        })
    }
    
    @objc func tweetButtonAction() {
        print("tweetButtonがタップされました")
    }
    
    @objc func addButtonTapped() {
        print("tapped")
    }
    
    @objc func deleteButtonTapped() {
        print("delete")
    }
}

//class ViewController: UIViewController {
//
//    let addButtonImage = UIImage(named: "close")
//    let deleteButtonImage = UIImage(named: "deleteButton")
//    let tweetButtonImage = UIImage(named: "TweetButton")
//
//    @IBOutlet weak var manuButton: UIButton!
//
//    var isTapped:Bool = false
//
//    let customButton = CustomButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        customButton.manuButton = self.manuButton
//        customButton.manuPosition = self.manuButton.layer.position
//
//        customButton.addButton.setImage(addButtonImage, for: .normal)
//        customButton.deleteButton.setImage(deleteButtonImage, for: .normal)
//        customButton.tweetButton.setImage(tweetButtonImage, for: .normal)
//
////        view.isUserInteractionEnabled = true
//
//
//
//        self.manuButton.addTarget(customButton, action: #selector(customButton.movementWhenManuButtonTapped), for: .touchUpInside)
//        customButton.addButton.addTarget(self, action: #selector(self.tapped(_:)), for: .touchUpInside)
//        self.view.addSubview(manuButton)
//        self.view.addSubview(customButton)
//    }
//
//    @objc func tapped(_ sender: UIButton) {
//
//        if isTapped == false {
//            view.backgroundColor = UIColor.red
//            isTapped = !isTapped
//        } else {
//            view.backgroundColor = UIColor.white
//            isTapped = !isTapped
//        }
//
//    }
//}


//
//  ViewController.swift
//  UIKit072
//
//  Created by Misato Morino on 2016/08/15.
//  Copyright © 2016年 Misato Morino. All rights reserved.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//    var mainButton: UIButton = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // 背景を黒色に設定.
//        self.view.backgroundColor = UIColor.black
//
//        // mainボタン生成.
//        mainButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        mainButton.center = self.view.center
//
//        // myCustomButtonクラスのインスタンス生成.
//        let myCusButton: MyCustomButton = MyCustomButton(frame: self.view.frame)
//        myCusButton.mainButton = self.mainButton
//        myCusButton.mainPosition = self.mainButton.layer.position
//
//        // インスタンスをviewに追加.
//        self.view.addSubview(myCusButton)
//
//        // mainボタン各設定.
//        mainButton.layer.masksToBounds = true
//        mainButton.layer.cornerRadius = 50.0
//        mainButton.backgroundColor = UIColor.red
//        mainButton.setTitle("Fire!", for: .normal)
//        mainButton.setTitleColor(UIColor.white, for: .normal)
//        mainButton.addTarget(myCusButton, action: #selector(myCusButton.onDownMainButton(sender:)), for: UIControl.Event.touchUpInside)
//        mainButton.addTarget(myCusButton, action: #selector(myCusButton.onUpMainButton(sender:)), for: [.touchUpInside, .touchDragOutside])
//        mainButton.tag = 0
//
//        // mainボタンをviewに追加.
//        self.view.addSubview(mainButton)
//    }
//
//}
