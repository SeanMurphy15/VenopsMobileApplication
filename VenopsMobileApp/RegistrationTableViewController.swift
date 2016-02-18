//
//  RegistrationTableViewController.swift
//  VenopsMobileApp
//
//  Created by Jay Maloney on 1/27/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import UIKit
import Firebase


class RegistrationTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    static var currentDeviceType = ResourceController.currentDeviceType()
    static var currentDate = ResourceController.currentDate()



    @IBOutlet weak var scanAnimiationView: UIImageView!

    @IBOutlet weak var usernameTextField: UITextField!

    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var confirmPasswordTextField: UITextField!

    @IBOutlet weak var profileImageView: UIImageView!

    @IBOutlet weak var firstNameTextField: UITextField!

    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var streetAddressTextField: UITextField!

    @IBOutlet weak var cityTextField: UITextField!

    @IBOutlet weak var stateTextField: UITextField!

    @IBOutlet weak var zipcodeTextField: UITextField!

    @IBOutlet weak var companyTextField: UITextField!

    @IBOutlet weak var websiteTextField: UITextField!

    @IBOutlet weak var workPhoneNumberTextField: UITextField!

    @IBOutlet weak var mobilePhoneNumberTextField: UITextField!

    @IBOutlet weak var venopsReferalTextField: UITextView!

    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {

        AnimationController.animateScannning(scanAnimiationView)

    }

    override func viewDidAppear(animated: Bool) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func scanDriversLicenseButtonTapped(sender: AnyObject) {

        UserController.saveUserDataToNSUserDefaults(usernameTextField.text, key: "username")
        UserController.saveUserDataToNSUserDefaults(emailTextField.text, key: "email")
        UserController.saveUserDataToNSUserDefaults(passwordTextField.text, key: "password")
        UserController.saveUserDataToNSUserDefaults(confirmPasswordTextField.text, key: "confirmPassword")
        performSegueWithIdentifier("toScannerViewController", sender: nil)
    }










    @IBAction func registerButtonTapped(sender: AnyObject) {

        ContentController.verifyRequiredTextFields(usernameTextField: "sdm123", emailTextField: "maloneyjay@gmail.com", passwordTextField: "123", confirmPasswordTextField: "1234", firstNameTextField: "bob", lastNameTextField: "sniffs", streetAddressTextField: "666", cityTextField: "HELL", stateTextField: "FIRE", zipcodeTextField: "666") { (success, title, message, actionTitle) -> Void in

            if success == false {

                self.generalAlert(title: title!, message: message!, actionTitle: actionTitle!)
            } else {

                

            }

        }

    }














    @IBAction func uploadImageButtonTapped(sender: AnyObject) {

        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        let avatarAlert = UIAlertController(title: "Select Photo Location", message: nil, preferredStyle: .ActionSheet)

        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            avatarAlert.addAction(UIAlertAction(title: "Library", style: .Default, handler: { (_) -> Void in
                imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }))
        }

        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            avatarAlert.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { (_) -> Void in
                imagePicker.sourceType = .Camera
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }))
        }

        avatarAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.presentViewController(avatarAlert, animated: true, completion: nil)
        })

    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        if let myImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.profileImageView.image = myImage
            
        }
    }
    
    
    
    
}











