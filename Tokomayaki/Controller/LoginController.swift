//
//  ViewController.swift
//  Tokomayaki
//
//  Created by Divyam Solanki on 16/06/21.
//

import UIKit

class LoginController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //An Image view for the logo
    private let imageView: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Logo2")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    //An Image view for the Background
    private let imageView1: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Rec1")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    //For the van
    private let imageView2: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Van")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Adding a Background Color
        
        let color: UIColor = #colorLiteral(red: 0.4274509804, green: 0.8392156863, blue: 0.631372549, alpha: 1)
        self.view.backgroundColor = color
        
        view.addSubview(imageView2)
        view.addSubview(imageView1)
        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
   
        imageView.frame = CGRect(x: view.frame.midX/3, y: view.safeAreaInsets.top - 50, width: view.frame.size.width-150, height: view.frame.size.width - 150)
        
        imageView1.frame = CGRect(x: view.frame.midX/3 - view.frame.midY/4, y: view.safeAreaInsets.top + 80, width: view.frame.size.width+100, height: view.frame.size.width + 100)
        
        imageView2.frame = CGRect(x: view.frame.midX/7, y: view.safeAreaInsets.top + 500, width: view.frame.size.width-50, height: view.frame.size.width - 50)
        
    }
    


}

