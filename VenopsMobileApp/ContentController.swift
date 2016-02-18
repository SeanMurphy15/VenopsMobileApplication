//
//  ContentController.swift
//  VenopsMobileApp
//
//  Created by Sean Murphy on 2/4/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import Foundation

class ContentController{



    static func verifyRequiredTextFields(usernameTextField usernameTextField: String?, emailTextField: String?, passwordTextField: String?, confirmPasswordTextField: String?, firstNameTextField: String?, lastNameTextField: String?, streetAddressTextField: String?, cityTextField: String?, stateTextField: String?, zipcodeTextField: String?, completion: (success: Bool, title: String?, message: String?, actionTitle: String?)->Void){



        switch (1 > 0) {


        case usernameTextField == "":
            completion(success: false, title: "Incomplete Registration", message: "No data for \"Username\". Please fill in the required field to continue.", actionTitle: "OK")
            break
        case emailTextField == "":
            completion(success: false, title: "Incomplete Registration", message: "No data for \"Email\". Please fill in the required field to continue.", actionTitle: "OK")
            break
        case passwordTextField == "":
             completion(success: false, title: "Incomplete Registration", message: "No data for \"Password\". Please fill in the required field to continue.", actionTitle: "OK")
            break
        case confirmPasswordTextField == "":
            completion(success: false, title: "Incomplete Registration", message: "No data for \"Confirm Password\". Please fill in the required field to continue.", actionTitle: "OK")
            break
        case passwordTextField != confirmPasswordTextField:
            completion(success: false, title: "Passwords Don't Match", message: "Please verify password fields to continue.", actionTitle: "Redo")
            break
        case firstNameTextField == "":
            completion(success: false, title: "Incomplete Registration", message: "No data for \"First Name\". Please fill in the required field to continue.", actionTitle: "OK")
            break
        case lastNameTextField == "":
            completion(success: false, title: "Incomplete Registration", message: "No data for \"Last Name\". Please fill in the required field to continue.", actionTitle: "OK")
            break
        case streetAddressTextField == "":
            completion(success: false, title: "Incomplete Registration", message: "No data for \"Street Address\". Please fill in the required field to continue.", actionTitle: "OK")
            break
        case cityTextField == "":
            completion(success: false, title: "Incomplete Registration", message: "No data for \"City\". Please fill in the required field to continue.", actionTitle: "OK")
            break
        case stateTextField == "":
            completion(success: false, title: "Incomplete Registration", message: "No data for \"State\". Please fill in the required field to continue.", actionTitle: "OK")
            break
        case zipcodeTextField == "":
            completion(success: false, title: "Incomplete Registration", message: "No data for \"Zipcode\". Please fill in the required field to continue.", actionTitle: "OK")
            break

        default:

            UserController.verifyUsername(usernameTextField!, completion: { (success) -> Void in

                if success == false {


                    completion(success: false, title: "Error", message: "\(usernameTextField!) is already in use. Please choose another username.", actionTitle: "Redo")

                }
            })

            UserController.verifyEmail(emailTextField!, completion: { (success) -> Void in

                if success == false {


                    completion(success: false, title: "Error", message: "\(emailTextField!) is already in use. Please choose another email.", actionTitle: "Redo")

                }
                
            })
            break
        }
    }


}






















