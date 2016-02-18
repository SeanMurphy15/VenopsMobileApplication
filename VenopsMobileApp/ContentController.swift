//
//  ContentController.swift
//  VenopsMobileApp
//
//  Created by Sean Murphy on 2/4/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import Foundation

class ContentController{

    static  func collectDataFromTextFields(usernameTextField usernameTextField: String?, licenseNumberField: String?, dobField: String?, emailField: String?, passwordField: String? , firstnameField: String?, lastnameField: String?, addressTextField: String?, stateTextField: String?, cityTextField: String?, zipcodeTextField: String? ,completion:(success: Bool, error: NSError?) -> Void ){

        let error = NSError?()

        if usernameTextField != nil && licenseNumberField != nil && dobField != nil && emailField != nil && passwordField != nil && firstnameField != nil && lastnameField != nil && addressTextField != nil && stateTextField != nil && zipcodeTextField != nil {

            UserController.saveUserDataToNSUserDefaults(usernameTextField, key: "username")
            UserController.saveUserDataToNSUserDefaults(licenseNumberField, key: "licenseNumber")
            UserController.saveUserDataToNSUserDefaults(dobField, key: "dateOfBirth")
            UserController.saveUserDataToNSUserDefaults(emailField, key: "email")
            UserController.saveUserDataToNSUserDefaults(passwordField, key: "password")
            UserController.saveUserDataToNSUserDefaults(firstnameField, key: "firstName")
            UserController.saveUserDataToNSUserDefaults(lastnameField, key: "lastName")
            UserController.saveUserDataToNSUserDefaults(addressTextField, key: "address")
            UserController.saveUserDataToNSUserDefaults(stateTextField, key: "state")
            UserController.saveUserDataToNSUserDefaults(zipcodeTextField, key: "zipcode")
            UserController.saveUserDataToNSUserDefaults(cityTextField, key: "city")

            completion(success: true, error: nil)

        }
        else{
            
            completion(success: false, error: error)
        }
        
        
        
    }

}