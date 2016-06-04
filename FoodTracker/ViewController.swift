//
//  ViewController.swift
//  FoodTracker
//
//  Created by ServesyOfficial on 6/3/16.
//  Copyright © 2016 servesy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var mealNameLabel: UILabel!

    @IBOutlet var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        print("Hello")
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealNameLabel.text = "Default Text"
        
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerControl = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerControl.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerControl.delegate = self
        
        presentViewController(imagePickerControl, animated: true, completion: nil)

    }
    
    @IBAction func selectPhotoFromPhotoLibrary(sender: UITapGestureRecognizer) {
        print("inside picker")
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerControl = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerControl.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerControl.delegate = self
        
        presentViewController(imagePickerControl, animated: true, completion: nil)
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = nameTextField.text
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        photoImageView.image = selectedImage
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

