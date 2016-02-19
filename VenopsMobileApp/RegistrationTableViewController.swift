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

     var currentDeviceType = ResourceController.currentDeviceType()
     var currentDate = ResourceController.currentDate()



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

        UserController.deleteUserDataObjectFromNSUserDefaults("username")
        UserController.deleteUserDataObjectFromNSUserDefaults("email")
        UserController.deleteUserDataObjectFromNSUserDefaults("password")
        UserController.deleteUserDataObjectFromNSUserDefaults("confirmPassword")


    }


    @IBAction func scanDriversLicenseButtonTapped(sender: AnyObject) {

        UserController.saveUserDataToNSUserDefaults(usernameTextField.text, key: "username")
        UserController.saveUserDataToNSUserDefaults(emailTextField.text, key: "email")
        UserController.saveUserDataToNSUserDefaults(passwordTextField.text, key: "password")
        UserController.saveUserDataToNSUserDefaults(confirmPasswordTextField.text, key: "confirmPassword")
        performSegueWithIdentifier("toScannerViewController", sender: nil)
    }










    @IBAction func registerButtonTapped(sender: AnyObject) {

        ContentController.verifyRequiredTextFields(usernameTextField: usernameTextField.text, emailTextField: emailTextField.text, passwordTextField: passwordTextField.text, confirmPasswordTextField: confirmPasswordTextField.text, firstNameTextField: firstNameTextField.text, lastNameTextField: lastNameTextField.text, streetAddressTextField: streetAddressTextField.text, cityTextField: cityTextField.text, stateTextField: stateTextField.text, zipcodeTextField: zipcodeTextField.text) { (success, title, message, actionTitle) -> Void in

            if success == false {

                self.generalAlert(title: title!, message: message!, actionTitle: actionTitle!)

            } else {

                ContentController.verifyOptionalTextFields(companyTextField: self.companyTextField.text, websiteTextField: self.websiteTextField.text, workPhoneNumberTextField: self.workPhoneNumberTextField.text, mobilePhoneNumberTextField: self.mobilePhoneNumberTextField.text, venopsReferalTextView: self.venopsReferalTextField.text, completion: { (success, optionalTextFieldData) -> Void in

                    if success == false {

                                print("error getting data from optional text fields")
                    } else {

                        UserController.createUser(self.emailTextField.text!,
                            password: self.passwordTextField.text!,
                            firstName: self.firstNameTextField.text!,
                            middleName: UserController.publishUserDataFromNSUserDefaults("middleName"),
                            lastName: self.lastNameTextField.text!,
                            username: self.usernameTextField.text!,
                            dateOfBirth: UserController.publishUserDataFromNSUserDefaults("dateOfBirth"),
                            city: self.cityTextField.text!,
                            state: self.stateTextField.text!,
                            zipcode: self.zipcodeTextField.text!,
                            licenseNumber: UserController.publishUserDataFromNSUserDefaults("licenseNumber"),
                            weight: UserController.publishUserDataFromNSUserDefaults("weight"),
                            height: UserController.publishUserDataFromNSUserDefaults("height"),
                            organDonor: UserController.publishUserDataFromNSUserDefaults("organDonor"),
                            licenseExpirationDate: UserController.publishUserDataFromNSUserDefaults("licenseExpirationDate"),
                            eyeColor: UserController.publishUserDataFromNSUserDefaults("eyeColor"),
                            hairColor: UserController.publishUserDataFromNSUserDefaults("hairColor"),
                            sex: UserController.publishUserDataFromNSUserDefaults("sex"),
                            deviceType: self.currentDeviceType,
                            dateOfRegistration: self.currentDate,
                            completion: { (success, user, error) -> Void in

                                if success == false {

                                    if let error = error {

                                        self.generalAlert(title: "Error", message: "\(error.localizedDescription)", actionTitle: "OK")
                                    }

                                } else {

                                    if let userIdentifier = user?.identifier {

                                        if let profileImage = self.profileImageView.image {

                                            ImageController.saveProfileImage(identifier: userIdentifier, image: profileImage, completion: { (success) -> Void in

                                                if success == false {

                                                    print("Profile photo did not upload")

                                                } else {

                                                    print("User successfully uploaded to Firebase!")
                                                }
                                            })
                                        }
                                    }
                                }
                        })

                    }
                })

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











