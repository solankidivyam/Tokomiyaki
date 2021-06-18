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
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 25)
        label.textColor = UIColor.white
        label.text = "Log in"
        label.numberOfLines = 0
        
        return label
    }()
    
    private let textField1: UITextField = {
       
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir", size: 15)
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5568627451, alpha: 1)])
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
//        textField.layer.borderWidth = 0.25
        textField.layer.cornerRadius = textField.frame.size.height / 2
        textField.keyboardType = UIKeyboardType.default
        return textField
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
        view.addSubview(textField1)
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
   
        
        textField1.frame = CGRect(x: view.frame.midX/3 + 25, y: view.safeAreaInsets.top + 220, width: 220, height: 37)
            
        
        label.frame = CGRect(x: view.frame.midX/3 + 15, y: view.safeAreaInsets.top + 130, width: 100, height: 100)
        
        imageView.frame = CGRect(x: view.frame.midX/3, y: view.safeAreaInsets.top - 50, width: view.frame.size.width-150, height: view.frame.size.width - 150)
        
        imageView1.frame = CGRect(x: view.frame.midX/3 - view.frame.midY/4, y: view.safeAreaInsets.top + 80, width: view.frame.size.width+100, height: view.frame.size.width + 100)
        
        imageView2.frame = CGRect(x: view.frame.midX/7, y: view.safeAreaInsets.top + 500, width: view.frame.size.width-50, height: view.frame.size.width - 50)
        
        
    }
    


}

