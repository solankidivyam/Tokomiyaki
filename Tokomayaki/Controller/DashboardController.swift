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
    
    private let logout: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        button.setTitle("Log Out", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(#colorLiteral(red: 0.9559958577, green: 0.9549930692, blue: 0.8105223179, alpha: 1), for: UIControl.State.normal)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color: UIColor = #colorLiteral(red: 0.3695068359, green: 0.8321683407, blue: 0.6322148442, alpha: 1)
        self.view.backgroundColor = color
        view.addSubview(logout)
        logout.addTarget(self, action: #selector(logoutBut), for: .touchUpInside)
//        view.addSubview(imageViewDash)
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
        imageViewDash.frame = CGRect(x: view.frame.midX/3, y: view.safeAreaInsets.top - 50, width: view.frame.size.width-150, height: view.frame.size.width - 150)
        logout.frame = CGRect(x: view.frame.size.width/3 + 10, y: view.safeAreaInsets.top + 330, width: 120, height: 37)
        
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
