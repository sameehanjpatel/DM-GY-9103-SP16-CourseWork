//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Sameehan Patel on 3/27/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate,
    UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBAction func removeImage(sender: UIBarButtonItem) {
        imageView.image = nil
    }
    
    @IBAction func backgroundTapped(sender: UITapGestureRecognizer) { view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var serialField: UITextField!
    @IBOutlet var dateField: UILabel!
    @IBAction func takePicture(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        
        // If the device has a camera, take a picture, otherwise,
        // just pick from photo library
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = .Camera
        }
        else {
            imagePicker.sourceType = .PhotoLibrary
        }
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        
        // Place image picker on the screen
        presentViewController(imagePicker, animated: true, completion: nil)

    }
    
    func imagePickerController(picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [String: AnyObject]) {
    
    // Get picked image from info dictionary
    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    
    
    // Put that image onto the screen in our image view
    imageView.image = image
        
    // Store the image in the ImageStore for the item's key
        imageStore.setImage(image, forKey:item.itemKey)
    
    // Take image picker off the screen -
    // you must call this dismiss method
    dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet var imageView: UIImageView!
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    var imageStore: ImageStore!
    
    let numberFormatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    } ()
    
    let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .NoStyle
        return formatter
    } ()
    
    override func viewWillAppear (animated: Bool){
        super.viewWillAppear(animated)
        nameField.text = item.name
        serialField.text = item.serialNumber
        valueField.text = numberFormatter.stringFromNumber(item.valueInDollars)
        dateField.text = dateFormatter.stringFromDate(item.dateCreated)
   
        // Get the item key
    let key = item.itemKey
    
    // If there is an associated image with the item
    if let imageToDisplay = imageStore.imageForKey(key) {
        // display it on the image view
        imageView.image = imageToDisplay
    }
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        //clear first responder
        view.endEditing(true)
        
        //saving changes to item 
        item.name = nameField.text ?? ""
        item.serialNumber = serialField.text
        
        if let valueText = valueField.text,
            value = numberFormatter.numberFromString(valueText)
        { item.valueInDollars = value.integerValue
        }
        else {
            item.valueInDollars = 0
        }
    
    }
}



