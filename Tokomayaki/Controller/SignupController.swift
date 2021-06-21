//
//  SignupController.swift
//  Tokomayaki
//
//  Created by Divyam Solanki on 19/06/21.
//

import UIKit
import Parse

// Explaination
// MVVM : Future Scope
// Model : Defines the schema of the app like what type of data will be stored. Like for example a structure
// View : It basically deals with the the UI elements that go on the screen and the placement of the same. Currently it is being
//       shown in the Login View Controller only..
// ViewModel : In layman's terms it basically deals with the logic and working of the app in the back. It deals with the connection of
//            the view and the mode.

// UIViewController : It deals with all of the MVVM components. It helps the navigation between different screens.
// We are using it for all the MVVM, we can easily seperate out the components and place them in different files and UI controller only to
// navigate and display the UI..

// This is the ROOTVIEW Controller since no Storyboard is used, all the code written for all the UICOMPONENTS

class SignupController: UIViewController {
    
    weak var indicatorSignup: UIActivityIndicatorView!
    
    //An Image view for the logo 2
    private let imageView3: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Logo2")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    // Button for Signup and registering the user
    private let button3: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.768627451, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .light)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(#colorLiteral(red: 0.3960784314, green: 0.3960784314, blue: 0.3960784314, alpha: 1), for: UIControl.State.normal)
        return button
        
    }()
    
    // UI button for navigating to the logincontroller screen
    private let button4: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        button.setTitle("Login?", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(#colorLiteral(red: 0.9559958577, green: 0.9549930692, blue: 0.8105223179, alpha: 1), for: UIControl.State.normal)
        return button
        
    }()
    
    //An Image view for the Background
    private let imageView4: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Rec1")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    //For the van
    private let imageView5: UIImageView = {
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Van")
    imageView.contentMode = .scaleAspectFit
    return imageView
        
    }()
    
    // Label
    private let label3: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 25)
        label.textColor = UIColor.white
        label.text = "Sign Up"
        label.numberOfLines = 0
        
        return label
    }()
    
    // Label
    private let label4: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 18)
        label.textColor = UIColor.white
        label.text = "or"
        label.numberOfLines = 0
        
        return label
    }()
    
    // Label
    private let label5: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 10)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "If already a member of Toko family.."
        label.numberOfLines = 0
        
        return label
    }()
    
    // Textfield taking Email
    private let textField3: UITextField = {
       
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir Next", size: 15)
        textField.setCorner(radius: 12)
        textField.setLeftPaddingPoints(15)
        textField.backgroundColor = UIColor.white
//        textField.fix(SintextField3)
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7254901961, green: 0.7254901961, blue: 0.7254901961, alpha: 1)])
        textField.autocapitalizationType = .none
        textField.keyboardType = UIKeyboardType.default
        return textField
    }()
    
    // Textfield taking Password
    private let textField4: UITextField = {
       
        let textField = UITextField()
        textField.font = UIFont(name: "Avenir Next", size: 15)
        textField.setCorner(radius: 12)
        textField.setLeftPaddingPoints(15)
        textField.backgroundColor = UIColor.white
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.7254901961, green: 0.7254901961, blue: 0.7254901961, alpha: 1)])
//        textField.isSecureTextEntry = true
        textField.keyboardType = UIKeyboardType.default
        return textField
    }()
    
    // Textfield taking Username instead of Name :: :: ::
    private let textField5: UITextField = {
       
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // We are loading our UI here manually, hard coded UI
        // Other wise we can use a view to reduce the code size here
        
        //Adding a Background Color
        let color: UIColor = #colorLiteral(red: 0.3695068359, green: 0.8321683407, blue: 0.6322148442, alpha: 1)
        self.view.backgroundColor = color
        
        // Adding all the subviews
        viewSafeAreaInsetsDidChange()
        view.addSubview(imageView3)
        view.addSubview(imageView4)
        view.addSubview(imageView5)
        view.addSubview(textField3)
        view.addSubview(textField4)
        view.addSubview(textField5)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        view.addSubview(button3)
        view.addSubview(button4)
        
        // Adding the functionality of the buttons
        button4.addTarget(self, action: #selector(didTapButton1), for: .touchUpInside)
        button3.addTarget(self, action: #selector(signup), for: .touchUpInside)
    }
    
    //Important functions
    //It helps navigate between multiple screens
    @objc private func didTapButton1() {
        
        // As seen in the Appdelegate.swift
        // In the function we are basically changing rootViewController such that the app
        // navigates to a different screen with transition
        let notVC = LoginController()
        let navVC = UINavigationController(rootViewController: notVC)
        navVC.modalPresentationStyle = .overFullScreen
        navVC.modalTransitionStyle = .crossDissolve
        present(navVC, animated: true)
    }
    
    
    // Adding all the frame and positioning details to all the UI Components otherwise done in Storyboard
    // Only optimised for iPhone 11 and 12 phones, it can be implemented across all devices after certain changes in the frame values
    // Future Scope : It takes a lot of time to calculate and place all the components, will be done in future
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        imageView3.frame = CGRect(x: view.frame.midX/3, y: view.safeAreaInsets.top - 50, width: view.frame.size.width-150, height: view.frame.size.width - 150)
        
        button3.frame = CGRect(x: view.frame.size.width/3 + 10, y: view.safeAreaInsets.top + 380, width: 120, height: 37)
        
        button4.frame = CGRect(x: view.frame.size.width/3 + 20, y: view.safeAreaInsets.top + 445, width: 100, height: 37)
        
        textField3.frame = CGRect(x: view.frame.midX/3 + 30, y: view.safeAreaInsets.top + 220, width: 220, height: 37)
        
        textField4.frame = CGRect(x: view.frame.midX/3 + 30, y: view.safeAreaInsets.top + 270, width: 220, height: 37)
        
        textField5.frame = CGRect(x: view.frame.midX/3 + 30, y: view.safeAreaInsets.top + 320, width: 220, height: 37)
        
        label3.frame = CGRect(x: view.frame.midX/3 + 15, y: view.safeAreaInsets.top + 140, width: 100, height: 100)
        
        label4.frame = CGRect(x: view.frame.size.width/3 + 45, y: view.safeAreaInsets.top + 410, width: 50, height: 50)
        
        label5.frame = CGRect(x: view.frame.size.width/3 - 52, y: view.safeAreaInsets.top + 445, width: 240, height: 100)
        
        imageView4.frame = CGRect(x: view.frame.midX/3 - view.frame.midY/4, y: view.safeAreaInsets.top + 80, width: view.frame.size.width+100, height: view.frame.size.width + 100)
        
        imageView5.frame = CGRect(x: view.frame.midX/7, y: view.safeAreaInsets.top + 500, width: view.frame.size.width-50, height: view.frame.size.width - 50)
        
    
    }
    
    // A function used to Signup the User
    // We are using code from the Back4app to register the given user
    @objc func signup(_ sender: Any) {
            
        let user = PFUser()
        
        user.email = self.textField3.text
        user.password = self.textField4.text
        user.username = self.textField5.text
        
        
        
        self.indicatorSignup?.startAnimating()
        user.signUpInBackground {(succeeded: Bool, error: Error?) -> Void in
                    self.indicatorSignup?.stopAnimating()
                    if let error = error  {
                        self.displayAlert(withTitle: "Error", message: error.localizedDescription)
                    }
                    //Contraints
                    if (user.email!.count > 56 || (error != nil)) {
                        self.displayAlert(withTitle: "More than 56 values in email", message: "Try shorting")
                    }
                    if (user.password!.count < 6 || user.password!.count > 27 || (error != nil)) {
                        self.displayAlert(withTitle: "Try changing password", message: "Should be greater than 6 characters")
                    }
                    else {
                        self.displayAlert(withTitle: "Success", message: "Account has been successfully created")
                    }
                }
    }
    
    // An important function displaing alerts for any updates
    func displayAlert(withTitle title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
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
