//
//  DashboardController.swift
//  Tokomayaki
//
//  Created by Divyam Solanki on 20/06/21.
//

import Foundation
import UIKit
import Parse
import SwiftUI

class DashboardController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    //An Image view for the logo 2
    private let imageViewDash: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Logo2")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    //Shipping image
    private let imageShip: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Shipping")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    //Label
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 25)
        label.textColor = UIColor.white
        label.text = "Welcome,"
        label.numberOfLines = 0
        
        return label
    }()
    
    //Label
    private let label6: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 20)
        label.textColor = UIColor.white
//        label.text = textfield1.text
        label.text = LoginController.textField1.text
        label.numberOfLines = 0
        
        return label
    }()
    
    //Label
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
    
    //Label
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
    
    // Rectangle UI components
    private let imageRec: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Recwhite")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    // Rectangle UI components
    private let imageRec2: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Recblack")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    // Rectangle UI components
    private let imageRec1: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Recyellow")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    // UI button for Logout and navigating to the LoginController
    private let logout: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        button.setTitle("Log Out", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(#colorLiteral(red: 0.9559958577, green: 0.9549930692, blue: 0.8105223179, alpha: 1), for: UIControl.State.normal)
        return button
        
    }()
    
    // UI button for getting started
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
        
        // Do any additional setup after loading the view.
        // We are loading our UI here manually, hard coded UI
        // Other wise we can use a view to reduce the code size here
        
        //Adding a Background Color
        let color: UIColor = #colorLiteral(red: 0.3695068359, green: 0.8321683407, blue: 0.6322148442, alpha: 1)
        self.view.backgroundColor = color
        
        // Adding all the subviews
        view.addSubview(logout)
        view.addSubview(imageViewDash)
        view.addSubview(imageViewDash)
        view.addSubview(imageRec)
        view.addSubview(imageShip)
        view.addSubview(imageRec2)
        view.addSubview(label)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label6)
        view.addSubview(imageRec1)
        view.addSubview(button)
        
        // Adding the functionality of the buttons
        logout.addTarget(self, action: #selector(logoutBut), for: .touchUpInside)
        button.addTarget(self, action: #selector(didTapButton4), for: .touchUpInside)
        
    }
    
    // Adding the map
    @objc func didTapButton4() {
        let vc = UIHostingController(rootView: ChooseArea())
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }

    
    // Similiar to login button it takes user back to the main screen
    @objc func logoutBut() {
        let loginVC = LoginController()
        let logVC = UINavigationController(rootViewController: loginVC)
        logVC.modalPresentationStyle = .overFullScreen
        logVC.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    
    
    // Adding all the frame and positioning details to all the UI Components otherwise done in Storyboard
    // Only optimised for iPhone 11 and 12 phones, it can be implemented across all devices after certain changes in the frame values
    // Future Scope : It takes a lot of time to calculate and place all the components, will be done in future
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: view.frame.midX/3 - 60, y: view.safeAreaInsets.top + 55, width: 150, height: 100)
        label6.frame = CGRect(x: view.frame.midX/3 + 30, y: view.safeAreaInsets.top + 60, width: 250, height: 100)
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
    
    // It helps disapper the navigation bar that comes as a result of changing the UIControllers
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // It helps disapper the navigation bar that comes as a result of changing the UIControllers
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}
