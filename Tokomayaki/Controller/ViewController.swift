//
//  ViewController.swift
//  Tokomayaki
//
//  Created by Divyam Solanki on 16/06/21.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private let imageView: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Logo2")
    imageView.contentMode = .scaleAspectFit
//    imageView.contentMode = UIView.ContentMode.center
//    imageView.layer.shadowColor = UIColor.black.cgColor
//    imageView.layer.shadowOpacity = 0.8
//    imageView.layer.shadowOffset = .zero
//    imageView.layer.shadowRadius = 10
    return imageView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Adding a gradient layer
        let gradient = CAGradientLayer()
    
        gradient.colors = [UIColor.init(hex: "51CE90")?.cgColor, UIColor.init(hex: "51CE90")?.cgColor]
        let startPoint = CGPoint(x: 0.1, y: 0.9)
        gradient.endPoint = CGPoint(x: 1.1, y: 1.1)
        gradient.frame = view.frame
        view.layer.addSublayer(gradient)
        
        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
   
        imageView.frame = CGRect(x: view.frame.midX/3, y: view.safeAreaInsets.top - 50, width: view.frame.size.width-150, height: view.frame.size.width - 150)
        
    }
    


}

