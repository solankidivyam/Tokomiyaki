//
//  ViewController.swift
//  Tokomayaki
//
//  Created by Divyam Solanki on 16/06/21.
//

import UIKit
import Parse

//Explaination 
//MVVM : Future Scope
//Model : Defines the schema of the app like what type of data will be stored. Like for example a structure
//View : It basically deals with the the UI elements that go on the screen and the placement of the same. Currently it is being
//       shown in the Login View Controller only..
//ViewModel : In layman's terms it basically deals with the logic and working of the app in the back. It deals with the connection of
//            the view and the mode.

//UIViewController : It deals with all of the MVVM components. It helps the navigation between different screens.
//We are using it for all the MVVM, we can easily seperate out the components and place them in different files and UI controller only to
//navigate and display the UI..


//This is the ROOTVIEW Controller since no Storyboard is used, all the code written for all the UICOMPONENTS
//Check AppDelegate.swift
class LoginController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //An Image view for the logo 1
    private let imageView: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Logo2")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    //Button for login
    private let button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.768627451, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .light)
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(#colorLiteral(red: 0.3960784314, green: 0.3960784314, blue: 0.3960784314, alpha: 1), for: UIControl.State.normal)
        return button
        
    }()
    
//    Button to navigate to Sign UP Screen
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
    
    //Label
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 25)
        label.textColor = UIColor.white
        label.text = "Log in"
        label.numberOfLines = 0
        
        return label
    }()
    
    //Label
    private let label1: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 18)
        label.textColor = UIColor.white
        label.text = "or"
        label.numberOfLines = 0
        
        return label
    }()
    
    //Label
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
    
    //A UI Textfield taking Username as an Input
     static let textField1: UITextField = {
       
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir Next", size: 15)
        textField.setCorner(radius: 12)
        textField.setLeftPaddingPoints(15)
        textField.backgroundColor = UIColor.white
        textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7254901961, green: 0.7254901961, blue: 0.7254901961, alpha: 1)])
        textField.autocapitalizationType = .none
        textField.keyboardType = UIKeyboardType.default
        return textField
    }()
    
    //A UI Textfield taking Password as an Input
    private let textField2: UITextField = {
       
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir Next", size: 15)
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
        // We are loading our UI here manually, hard coded UI
        // Other wise we can use a view to reduce the code size here
        
        //Adding a Background Color
        let color: UIColor = #colorLiteral(red: 0.4274509804, green: 0.8392156863, blue: 0.631372549, alpha: 1)
        self.view.backgroundColor = color
        
        // Adding all the subviews
        view.addSubview(imageView2)
        view.addSubview(imageView1)
        view.addSubview(imageView)
        view.addSubview(LoginController.textField1)
        view.addSubview(textField2)
        view.addSubview(label)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(button1)
        view.addSubview(button2)
        
        
        // Adding the functionality of the buttons
        button2.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button1.addTarget(self, action: #selector(signin), for: .touchUpInside)
        
    }
    
    
    
    
    //Important functions
    //It helps navigate between multiple screens
    @objc private func didTapButton() {
        // As seen in the Appdelegate.swift
        // In the function we are basically changing rootViewController such that the app
        // navigates to a different screen with transition
        let notVC = SignupController()
        let navVC = UINavigationController(rootViewController: notVC)
        navVC.modalPresentationStyle = .overFullScreen
        navVC.modalTransitionStyle = .crossDissolve
        present(navVC, animated: true)
    }
    
    // A function used to Sigin the User
    // We are using code from the Back4app to check the given user
    @objc func signin(_ sender: Any) {
        
        PFUser.logInWithUsername(inBackground: LoginController.textField1.text!, password: self.textField2.text!) {
                  (user: PFUser?, error: Error?) -> Void in
                  if user != nil {
                    // Alerting the user
                    self.displayAlert(withTitle: "Login Successful", message: "")
                  } else {
                    self.displayAlert(withTitle: "Error", message: error!.localizedDescription)
                  }
                }
        }
    
    
    // An important function
    func displayAlert(withTitle title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                
                //For debugging
                print("Yay! You brought your towel!")
                
                // If login is successful then the LoginController takes the user to a dashboard which is an onboarding screen
                if(title == "Login Successful") {
                    let dashVC = DashboardController()
                    let navVC1 = UINavigationController(rootViewController: dashVC)
                    navVC1.modalPresentationStyle = .overFullScreen
                    navVC1.modalTransitionStyle = .crossDissolve
                    self.present(navVC1, animated: true)
                }
               

            }))
//            alert.addChild(DashboardController())
            self.present(alert, animated: true)
        }

    
    @objc func dash() {
        
        let dashVC = DashboardController()
        let navVC1 = UINavigationController(rootViewController: dashVC)
        navVC1.modalPresentationStyle = .overFullScreen
        navVC1.modalTransitionStyle = .crossDissolve
        self.present(navVC1, animated: true)

    }
   
    // Adding all the frame and positioning details to all the UI Components otherwise done in Storyboard
    // Only optimised for iPhone 11 and 12 phones, it can be implemented across all devices after certain changes in the frame values
    // Future Scope : It takes a lot of time to calculate and place all the components, will be done in future
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
   
        
        button1.frame = CGRect(x: view.frame.size.width/3 + 10, y: view.safeAreaInsets.top + 330, width: 120, height: 37)
        
        button2.frame = CGRect(x: view.frame.size.width/3 + 20, y: view.safeAreaInsets.top + 400, width: 100, height: 37)
        
        LoginController.textField1.frame = CGRect(x: view.frame.midX/3 + 30, y: view.safeAreaInsets.top + 220, width: 220, height: 37)
        
        textField2.frame = CGRect(x: view.frame.midX/3 + 30, y: view.safeAreaInsets.top + 270, width: 220, height: 37)
            
        label.frame = CGRect(x: view.frame.midX/3 + 15, y: view.safeAreaInsets.top + 130, width: 100, height: 100)
        
        label1.frame = CGRect(x: view.frame.size.width/3 + 45, y: view.safeAreaInsets.top + 365, width: 50, height: 50)
        
        label2.frame = CGRect(x: view.frame.size.width/3 - 52, y: view.safeAreaInsets.top + 420, width: 240, height: 100)
        
        imageView.frame = CGRect(x: view.frame.midX/3, y: view.safeAreaInsets.top - 50, width: view.frame.size.width-150, height: view.frame.size.width - 150)
        
        imageView1.frame = CGRect(x: view.frame.midX/3 - view.frame.midY/4, y: view.safeAreaInsets.top + 80, width: view.frame.size.width+100, height: view.frame.size.width + 100)
        
        imageView2.frame = CGRect(x: view.frame.midX/7, y: view.safeAreaInsets.top + 500, width: view.frame.size.width-50, height: view.frame.size.width - 50)
        
        
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


