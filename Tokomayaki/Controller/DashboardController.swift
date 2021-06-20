//
//  DashboardController.swift
//  Tokomayaki
//
//  Created by Divyam Solanki on 20/06/21.
//

import Foundation
import UIKit
import Parse

class DashboardController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    private let imageViewDash: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Logo2")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    private let imageShip: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Shipping")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 25)
        label.textColor = UIColor.white
        label.text = "Welcome,"
        label.numberOfLines = 0
        
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 14)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "Congrats on becoming a part of Toko family, we deliver the best in class ice-creams across Japan and Taiwan. Starting soon in USA, Canada and UK..."
        label.numberOfLines = 0
        
        return label
    }()
    
    private let label3: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 14)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "Privacy Policy"
        label.numberOfLines = 0
        
        return label
    }()
    
    private let imageRec: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Recwhite")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    private let imageRec2: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Recblack")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    private let imageRec1: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Recyellow")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    private let logout: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        button.setTitle("Log Out", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(#colorLiteral(red: 0.9559958577, green: 0.9549930692, blue: 0.8105223179, alpha: 1), for: UIControl.State.normal)
        return button
        
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.768627451, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        button.setTitle("Get Started", for: .normal)
        button.layer.cornerRadius = 4
        button.setTitleColor(#colorLiteral(red: 0.2588235294, green: 0.2588235294, blue: 0.2588235294, alpha: 1), for: UIControl.State.normal)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color: UIColor = #colorLiteral(red: 0.3695068359, green: 0.8321683407, blue: 0.6322148442, alpha: 1)
        self.view.backgroundColor = color
        view.addSubview(logout)
        view.addSubview(imageViewDash)
        logout.addTarget(self, action: #selector(logoutBut), for: .touchUpInside)
        view.addSubview(imageViewDash)
        view.addSubview(imageRec)
        view.addSubview(imageShip)
        view.addSubview(imageRec2)
        view.addSubview(label)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(imageRec1)
        view.addSubview(button)
        
    }

    
    @objc func logoutBut() {
        let loginVC = LoginController()
        
        let logVC = UINavigationController(rootViewController: loginVC)
        logVC.modalPresentationStyle = .overFullScreen
        logVC.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(loginVC, animated: true)
//        present(navVC, animated: true)
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: view.frame.midX/3 - 60, y: view.safeAreaInsets.top + 55, width: 150, height: 100)
        imageViewDash.frame = CGRect(x: view.frame.midX/3 - 50, y: view.safeAreaInsets.top - 50, width: view.frame.size.width-230, height: view.frame.size.width - 230)
        logout.frame = CGRect(x: view.frame.size.width/3 + 160, y: view.safeAreaInsets.top + 20, width: 120, height: 37)
        imageRec.frame = CGRect(x: 0, y: view.safeAreaInsets.top + 20, width: view.frame.size.width, height: 100)
        imageRec1.frame = CGRect(x: view.frame.midX/3 - 40 , y: view.safeAreaInsets.top + 100, width: view.frame.size.width - 300, height: 50)
        imageRec2.frame = CGRect(x: view.frame.midX/3 + 85 , y: view.safeAreaInsets.top + 670, width: view.frame.size.width - 300, height: 50)
        imageShip.frame = CGRect(x: view.frame.midX/3 - 70, y: view.safeAreaInsets.top + 250, width: view.frame.size.width, height: view.frame.size.width)
        button.frame = CGRect(x: view.frame.size.width/3 - 20, y: view.safeAreaInsets.top + 630, width: 180, height: 42)
        label2.frame = CGRect(x: view.frame.size.width/3 - 50 , y: view.safeAreaInsets.top + 160, width: 240, height: 100)
        label3.frame = CGRect(x: view.frame.size.width/3 - 45 , y: view.safeAreaInsets.top + 700, width: 240, height: 100)
        
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
