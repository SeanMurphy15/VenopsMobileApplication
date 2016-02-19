//
//  RegistrationConfirmationTableViewController.swift
//  VenopsMobileApp
//
//  Created by Sean Murphy on 1/27/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import UIKit
import Firebase

class RegistrationConfirmationTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    

    
    
    // MARK: ViewMode Case Declarations
    enum ViewMode {
        case defaultView
        case editView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

<<<<<<< HEAD
//        UserController.deleteUserDataFromNSUserDefaults()
=======
        
>>>>>>> feature/ContentController
    }
    

    // MARK: ViewMode Switch Function
        // MARK: - BUTTONS
    
    @IBAction func editTapped(sender: AnyObject) {
        //updateViewForMode(ViewMode.editView)
        
    }
    
    
    @IBAction func editCancelTapped(sender: AnyObject) {
       // updateViewForMode(ViewMode.defaultView)
    }
    
    
    @IBAction func addProfileImageButtonTapped(sender: AnyObject) {
        //        uploadImageFromCameraSource()
        self.performSegueWithIdentifier("toAddPhoto", sender: nil)
    }
    
    
//    @IBAction func confirmButtonTapped(sender: AnyObject) {
//        
//        
//        ContentController.collectDataFromTextFields(usernameTextField: usernameTextField.text, licenseNumberField: licenseNumberField.text, dobField: dobField.text, emailField: emailField.text, passwordField: passwordField.text, firstnameField: firstnameField.text, lastnameField: lastnameField.text, addressTextField: addressTextField.text, stateTextField: stateTextField.text, cityTextField: cityTextField.text, zipcodeTextField: zipcodeTextField.text) { (success, error) -> Void in
//            
//            if success {
//                
//                UserController.verifiedDataForUserCreation({ (success, error, verifiedData) -> Void in
//                    if success {
//                        
//                        if let dict = verifiedData {
//                            
//                            UserController.createUser(dict["email"]!, password: dict["password"]!, firstName: dict["firstName"]!, lastName: dict["lastName"]!, username:  dict["username"]!, dateOfBirth: dict["dateOfBirth"]!, city: dict["city"]!, state: dict["state"]!, zipcode: dict["zipcode"]!, licenseNumber: dict["licenseNumber"]!, completion: { (success, user, error) -> Void in
//                                
//                                if success {
//                                    self.performSegueWithIdentifier("toAddPhoto", sender: nil)
//                                } else {
//
//                                    self.generalAlert(title: "Error", message: "\(error?.localizedDescription)", actionTitle: "OK")
//                                }
//                            })
//                        }
//                    }
//                })
//                
//            } else {
//                
//                self.generalAlert(title: "Error", message: "\(error?.localizedDescription)", actionTitle: "OK")
//            }
//        }
//    }
//}

//extension RegistrationConfirmationTableViewController: UITextFieldDelegate {
//    // Dismiss TextField
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
}

