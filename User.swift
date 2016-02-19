//
//  User.swift
//  VenopsMobileApp
//
//  Created by Sean Murphy on 1/30/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import Foundation
import Firebase

class User: Equatable, FirebaseType{

    private let emailKey = "email"
    private let firstNameKey = "firstName"
    private let middleNameKey = "middleName"
    private let lastNameKey = "lastName"
    private let usernameKey = "username"
    private let dateOfBirthKey = "dateOfBirth"
    private let cityKey = "city"
    private let stateKey = "state"
    private let zipcodeKey = "zipcode"
    private let licenseNumberKey = "licenseNumber"

    private let weightKey = "weight"
    private let heightKey = "height"
    private let organDonorKey = "organDonor"
    private let licenseExpirationDateKey = "licenseExpirationDate"
    private let eyeColorKey = "eyeColor"
    private let hairColorKey = "hairColor"
    private let sexKey = "sex"
    private let deviceTypeKey = "deviceType"
    private let dateOfRegistrationKey = "dateOfRegistration"

    private let companyKey = "company"
    private let websiteKey = "website"
    private let workPhoneNumberKey = "workPhoneNumber"
    private let mobilePhoneNumberKey = "mobilePhoneNumber"
    private let venopsReferralKey = "venopsReferral"

    var email = ""
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var username: String?
    var dateOfBirth: String?
    var city: String?
    var state: String?
    var zipcode: String?
    var licenseNumber: String?
    var identifier: String?
    var weight: String?
    var height: String?
    var organDonor: String?
    var licenseExpirationDate: String?

    var eyeColor: String?
    var hairColor: String?
    var sex: String?
    var deviceType: String?
    var dateOfRegistration: String?

    var company: String?
    var website: String?
    var workPhoneNumber: String?
    var mobilePhoneNumber: String?
    var venopsReferral: String?

    var endpoint: String {
        return "users"
    }
    var jsonValue: [String: AnyObject] {

        var json: [String: AnyObject] = [emailKey: email]

        if let firstName = firstName {
            json.updateValue(firstName, forKey: firstNameKey)
        }
        if let middleName = middleName {
            json.updateValue(middleName, forKey: middleNameKey)
        }
        if let lastName = lastName {
            json.updateValue(lastName, forKey: lastNameKey)
        }
        if let username = username {
            json.updateValue(username, forKey: usernameKey)
        }
        if let dateOfBirth = dateOfBirth {
            json.updateValue(dateOfBirth, forKey: dateOfBirthKey)
        }
        if let city = city {
            json.updateValue(city, forKey: cityKey)
        }
        if let state = state {
            json.updateValue(state, forKey: stateKey)
        }
        if let zipcode = zipcode {
            json.updateValue(zipcode, forKey: zipcodeKey)
        }
        if let licenseNumber = licenseNumber {
            json.updateValue(licenseNumber, forKey: licenseNumberKey)
        }
        if let weight = weight {
            json.updateValue(weight, forKey: weightKey)
        }
        if let height = height {
            json.updateValue(height, forKey: heightKey)
        }
        if let organDonor = organDonor {
            json.updateValue(organDonor, forKey: organDonorKey)
        }
        if let licenseExpirationDate = licenseExpirationDate {
            json.updateValue(licenseExpirationDate, forKey: licenseExpirationDateKey)
        }
        if let eyeColor = eyeColor {
            json.updateValue(eyeColor, forKey: eyeColorKey)
        }
        if let hairColor = hairColor {
            json.updateValue(hairColor, forKey: hairColorKey)
        }
        if let sex = sex {
            json.updateValue(sex, forKey: sexKey)
        }
        if let deviceType = deviceType {
            json.updateValue(deviceType, forKey: deviceTypeKey)
        }
        if let dateOfRegistration = dateOfRegistration {
            json.updateValue(dateOfRegistration, forKey: dateOfRegistrationKey)
        }
        if let company = company {
            json.updateValue(company, forKey: companyKey)
        }
        if let website = website {
            json.updateValue(website, forKey: websiteKey)
        }
        if let workPhoneNumber = workPhoneNumber {
            json.updateValue(workPhoneNumber, forKey: workPhoneNumberKey)
        }
        if let mobilePhoneNumber = mobilePhoneNumber {
            json.updateValue(mobilePhoneNumber, forKey: mobilePhoneNumberKey)
        }
        if let venopsReferral = venopsReferral {
            json.updateValue(venopsReferral, forKey: venopsReferral)
        }

        return json
    }

    required init?(json: [String: AnyObject], identifier: String) {

        guard let email = json[emailKey] as? String else { return nil }

        self.email = email
        self.firstName = json[firstNameKey] as? String
        self.middleName = json[middleNameKey] as? String
        self.lastName = json[lastNameKey] as? String
        self.username = json[usernameKey] as? String
        self.dateOfBirth = json[dateOfBirthKey] as? String
        self.city = json[cityKey] as? String
        self.state = json[stateKey] as? String
        self.zipcode = json[zipcodeKey] as? String
        self.licenseNumber = json[licenseNumberKey] as? String
        self.weight = json[weightKey] as? String
        self.height = json[heightKey] as? String
        self.organDonor = json[organDonorKey] as? String
        self.licenseExpirationDate = json[licenseExpirationDateKey] as? String
        self.eyeColor = json[eyeColorKey] as? String
        self.hairColor = json[hairColorKey] as? String
        self.sex = json[sexKey] as? String
        self.deviceType = json[deviceTypeKey] as? String
        self.dateOfRegistration = json[dateOfRegistrationKey] as? String
        self.identifier = identifier
    }


    init(email: String, uid: String, firstName: String?, middleName: String?, lastName: String?, username: String?, dateOfBirth: String?, city: String?, state: String?, zipcode: String?, licenseNumber: String?, weight: String?, height: String?, organDonor: String?, licenseExpirationDate: String?, eyeColor: String?, hairColor: String?, sex: String?, deviceType: String?, dateOfRegistration: String?) {

        self.email = email
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.username = username
        self.dateOfBirth = dateOfBirth
        self.city = city
        self.state = state
        self.zipcode = zipcode
        self.licenseNumber = licenseNumber
        self.weight = weight
        self.height = height
        self.organDonor = organDonor
        self.licenseExpirationDate = licenseExpirationDate
        self.eyeColor = eyeColor
        self.hairColor = hairColor
        self.sex = sex
        self.deviceType = deviceType
        self.dateOfRegistration = dateOfRegistration
        self.identifier = uid
    }
}

func ==(lhs: User, rhs: User) -> Bool {

    return (lhs.email == rhs.email) && (lhs.identifier == rhs.identifier)
}