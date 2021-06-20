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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageViewDash)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageViewDash.frame = CGRect(x: view.frame.midX/3, y: view.safeAreaInsets.top - 50, width: view.frame.size.width-150, height: view.frame.size.width - 150)
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
