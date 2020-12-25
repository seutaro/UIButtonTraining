//
//  ViewController.swift
//  UIButtonTraining
//
//  Created by shotaro takahashi on 2020/12/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonTapped(_ sender: UIButton) {
        animateView(sender)
    }
    
    
    func animateView(_ viewToAnimate:UIView) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
        }) { (_) in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                viewToAnimate.transform = .identity
                
            }, completion: nil)
        }
    }
    
    
    
    
    
}
