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

        animateScannnig()

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

        //Test

        
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

    func animateScannnig(){

        scanAnimiationView.animationImages = [
            UIImage(named: "scan1")!,
            UIImage(named: "scan2")!,
            UIImage(named: "scan3")!,
            UIImage(named: "scan4")!,
            UIImage(named: "scan5")!,
            UIImage(named: "scan6")!,
            UIImage(named: "scan7")!,
            UIImage(named: "scan8")!,
            UIImage(named: "scan9")!,
            UIImage(named: "scan10")!,
            UIImage(named: "scan11")!,
            UIImage(named: "scan12")!,
            UIImage(named: "scan13")!,
            UIImage(named: "scan14")!,
            UIImage(named: "scan15")!,
            UIImage(named: "scan16")!,
            UIImage(named: "scan17")!,
            UIImage(named: "scan18")!,
            UIImage(named: "scan19")!,
            UIImage(named: "scan20")!,
            UIImage(named: "scan21")!,
            UIImage(named: "scan22")!,
            UIImage(named: "scan23")!,
            UIImage(named: "scan24")!,
            UIImage(named: "scan25")!,
            UIImage(named: "scan26")!,
            UIImage(named: "scan27")!,
            UIImage(named: "scan28")!,
            UIImage(named: "scan29")!,
            UIImage(named: "scan30")!,
            UIImage(named: "scan31")!,
            UIImage(named: "scan32")!,
            UIImage(named: "scan33")!,
            UIImage(named: "scan34")!,
            UIImage(named: "scan35")!,
            UIImage(named: "scan36")!,
            UIImage(named: "scan37")!,
            UIImage(named: "scan38")!,
            UIImage(named: "scan39")!,
            UIImage(named: "scan40")!,
            UIImage(named: "scan41")!,
            UIImage(named: "scan42")!,
            UIImage(named: "scan43")!,
            UIImage(named: "scan44")!,
            UIImage(named: "scan45")!,
            UIImage(named: "scan46")!,
            UIImage(named: "scan47")!,
            UIImage(named: "scan48")!,
            UIImage(named: "scan49")!,
            UIImage(named: "scan50")!,
            UIImage(named: "scan51")!,
            UIImage(named: "scan52")!,
            UIImage(named: "scan53")!,
            UIImage(named: "scan54")!,
            UIImage(named: "scan55")!

        ]

        scanAnimiationView.animationDuration = 1.25
        scanAnimiationView.animationRepeatCount = 0
        scanAnimiationView.startAnimating()
    }




}











