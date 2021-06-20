//
//  ViewController.swift
//  Tokomayaki
//
//  Created by Divyam Solanki on 16/06/21.
//

import UIKit
import Parse


class LoginController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //An Image view for the logo
    private let imageView: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Logo2")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    private let button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.768627451, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .light)
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(#colorLiteral(red: 0.3960784314, green: 0.3960784314, blue: 0.3960784314, alpha: 1), for: UIControl.State.normal)
        return button
        
    }()
    
    private let button2: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        button.setTitle("Sign Up?", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(#colorLiteral(red: 0.9559958577, green: 0.9549930692, blue: 0.8105223179, alpha: 1), for: UIControl.State.normal)
        return button
        
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
    
    private let label1: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 18)
        label.textColor = UIColor.white
        label.text = "or"
        label.numberOfLines = 0
        
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 10)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "Create and account to be a part of Toko family, we deliver the best in class ice-creams across Japan and Taiwan. Starting soon in USA, Canada and UK..."
        label.numberOfLines = 0
        
        return label
    }()
    
    private let textField1: UITextField = {
       
        let textField = UITextField()
//        textField.layer.cornerRadius = 15.0
        textField.font = UIFont(name: "Avenir Next", size: 15)
//        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.setCorner(radius: 12)
        textField.setLeftPaddingPoints(15)
        textField.backgroundColor = UIColor.white
        textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7254901961, green: 0.7254901961, blue: 0.7254901961, alpha: 1)])
        textField.autocapitalizationType = .none
        textField.keyboardType = UIKeyboardType.default
        return textField
    }()
    
    private let textField2: UITextField = {
       
        let textField = UITextField()
//        textField.layer.cornerRadius = 15.0
        textField.font = UIFont(name: "Avenir Next", size: 15)
//        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.setCorner(radius: 12)
        textField.setLeftPaddingPoints(15)
        textField.backgroundColor = UIColor.white
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7254901961, green: 0.7254901961, blue: 0.7254901961, alpha: 1)])
        textField.isSecureTextEntry = true
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
        view.addSubview(textField2)
        view.addSubview(label)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(button1)
        view.addSubview(button2)
        
        button2.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button1.addTarget(self, action: #selector(signin), for: .touchUpInside)
        
    }
    
    
    
    
    @objc private func didTapButton() {
        let notVC = SignupController()
        
        let navVC = UINavigationController(rootViewController: notVC)
        navVC.modalPresentationStyle = .overFullScreen
        navVC.modalTransitionStyle = .crossDissolve
        
        present(navVC, animated: true)
    }
    
   
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
   
        
        button1.frame = CGRect(x: view.frame.size.width/3 + 10, y: view.safeAreaInsets.top + 330, width: 120, height: 37)
        
        button2.frame = CGRect(x: view.frame.size.width/3 + 20, y: view.safeAreaInsets.top + 400, width: 100, height: 37)
        
        textField1.frame = CGRect(x: view.frame.midX/3 + 30, y: view.safeAreaInsets.top + 220, width: 220, height: 37)
        
        textField2.frame = CGRect(x: view.frame.midX/3 + 30, y: view.safeAreaInsets.top + 270, width: 220, height: 37)
            
        label.frame = CGRect(x: view.frame.midX/3 + 15, y: view.safeAreaInsets.top + 130, width: 100, height: 100)
        
        label1.frame = CGRect(x: view.frame.size.width/3 + 45, y: view.safeAreaInsets.top + 365, width: 50, height: 50)
        
        label2.frame = CGRect(x: view.frame.size.width/3 - 52, y: view.safeAreaInsets.top + 420, width: 240, height: 100)
        
        imageView.frame = CGRect(x: view.frame.midX/3, y: view.safeAreaInsets.top - 50, width: view.frame.size.width-150, height: view.frame.size.width - 150)
        
        imageView1.frame = CGRect(x: view.frame.midX/3 - view.frame.midY/4, y: view.safeAreaInsets.top + 80, width: view.frame.size.width+100, height: view.frame.size.width + 100)
        
        imageView2.frame = CGRect(x: view.frame.midX/7, y: view.safeAreaInsets.top + 500, width: view.frame.size.width-50, height: view.frame.size.width - 50)
        
        
    }
    
    @objc func signin(_ sender: Any) {
        
        PFUser.logInWithUsername(inBackground: self.textField1.text!, password: self.textField2.text!) {
                  (user: PFUser?, error: Error?) -> Void in
                  if user != nil {
//                    self.displayAlert(withTitle: "Login Successful", message: "")
                    self.dashboardIn()
                  } else {
                    self.displayAlert(withTitle: "Error", message: error!.localizedDescription)
                  }
                }
        }
    
    
    func displayAlert(withTitle title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    
    func dashboardIn() {
        
        let dashVC = DashboardController()
        
        
        let navVC1 = UINavigationController(rootViewController: dashVC)
        navVC1.modalPresentationStyle = .overFullScreen
        navVC1.modalTransitionStyle = .crossDissolve
        
        self.present(navVC1, animated: true)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    


}


