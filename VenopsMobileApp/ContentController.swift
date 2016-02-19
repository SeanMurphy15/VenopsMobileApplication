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

            completion(success: true, title: nil, message: nil, actionTitle: nil)

            break
            
        }
    }


    static func verifyOptionalTextFields(companyTextField companyTextField: String?, websiteTextField: String?, workPhoneNumberTextField: String?, mobilePhoneNumberTextField: String?, venopsReferalTextView: String?, completion:(success: Bool, optionalTextFieldData: [String:String])-> Void){

        var textFieldDataDictionary = [String:String]()

        switch (1 > 0) {
        case companyTextField != "":
            if let company = companyTextField{
                textFieldDataDictionary["company"] = company
            }
         fallthrough

        case websiteTextField != "":
            if let website = websiteTextField{
                textFieldDataDictionary["website"] = website
            }
            fallthrough
        case workPhoneNumberTextField != "":
            if let workPhoneNumber = workPhoneNumberTextField{
                textFieldDataDictionary["workPhoneNumber"] = workPhoneNumber
            }
            fallthrough

        case mobilePhoneNumberTextField != "":
            if let mobilePhoneNumber = mobilePhoneNumberTextField{
                textFieldDataDictionary["mobilePhoneNumber"] = mobilePhoneNumber
            }
            fallthrough

        case mobilePhoneNumberTextField != "":
            if let mobilePhoneNumber = mobilePhoneNumberTextField{
                textFieldDataDictionary["mobilePhoneNumber"] = mobilePhoneNumber
            }
            fallthrough

        case venopsReferalTextView != "":
            if let venopsReferal = venopsReferalTextView{
                textFieldDataDictionary["venopsReferal"] = venopsReferal
            }
            break

        default:

            completion(success: false, optionalTextFieldData: [:])
            break;
        }

        completion(success: true, optionalTextFieldData: textFieldDataDictionary)
    }


}






















