//
//  ViewController.swift
//  Tokomayaki
//
//  Created by Divyam Solanki on 16/06/21.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gradient = CAGradientLayer()
        
        gradient.colors = [UIColor.init(hex: "cc2b5e")?.cgColor, UIColor.init(hex: "753a88")?.cgColor]
        let startPoint = CGPoint(x: 0.8, y: 0.5)
    }


}

