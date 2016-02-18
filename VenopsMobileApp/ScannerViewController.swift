//
//  ScannerViewController.swift
//  VenopsMobileApp
//
//  Created by Sean Murphy on 1/29/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import UIKit
import Firebase
import AudioToolbox

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var scannerView: UIView!
    @IBOutlet weak var popOutView: UIView!
    @IBOutlet weak var scanInstructionButton: UIBarButtonItem!
    

    let session         : AVCaptureSession = AVCaptureSession()
    var previewLayer    : AVCaptureVideoPreviewLayer!
    var scanData: [String:String] = [:]



    override func viewDidAppear(animated: Bool) {

        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let error : NSError? = nil
        var input: AVCaptureDeviceInput = AVCaptureDeviceInput()
        do {
            input = try  AVCaptureDeviceInput(device: device) as AVCaptureDeviceInput
        } catch let myJSONError {
            print(myJSONError)
        }
        if input !=  AVCaptureDeviceInput() {
            session.addInput(input)
        }
        else {
            self.generalAlert(title: "Error", message: "\(error?.localizedDescription)", actionTitle: "OK")
        }

        let output = AVCaptureMetadataOutput()
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        session.addOutput(output)
        output.metadataObjectTypes = output.availableMetadataObjectTypes
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = scannerView.bounds
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        scannerView.layer.addSublayer(previewLayer)
        session.startRunning()
    }

    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {

        ScanController.scanData(metadataObjects) { (success, scanData) -> Void in

            if success {

                self.scanData = scanData
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                self.session.stopRunning()
                self.performSegueWithIdentifier("toRegistrationTableViewController", sender: nil)

            } else {

                self.generalAlert(title: "Error", message: "Unable to scan driver's license! Make sure the surface is clean and visible!", actionTitle: "OK")
            }
        }


    }

    @IBAction func cancelButtonTapped(sender: AnyObject) {

        dismissViewControllerAnimated(true, completion: nil)
        
    }

    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "toRegistrationTableViewController" {

            let registrationTableViewController = segue.destinationViewController as! RegistrationTableViewController

            _ = registrationTableViewController.view

            registrationTableViewController.firstNameTextField.text = scanData["firstName"]
            registrationTableViewController.lastNameTextField.text = scanData["lastName"]
            registrationTableViewController.streetAddressTextField.text = scanData["address"]
            registrationTableViewController.cityTextField.text = scanData["city"]
            registrationTableViewController.stateTextField.text = scanData["state"]
            registrationTableViewController.zipcodeTextField.text = scanData["zipcode"]

        }

    }


}
