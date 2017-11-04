//
//  MemeEditorViewController.swift
//  MemeMe 2.0
//
//  Created by Jeremy Spradlin on 10/19/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit
import AVFoundation
import Photos



class MemeEditorViewController: MemeTextAtrributes, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, FontTableViewDelegate {
    
    //MARK: Variable declaration
    //IBOutlet Declaration
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var albumButton: UIBarButtonItem!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var topToolbar: UIToolbar!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    
    
    
    //Constant Declarations
    let textFieldDelegate = MemeTextFieldDelegate()
    let topText = "TOP"
    let bottomText = "BOTTOM"
    let defaultText = "HelveticaNeue-CondensedBlack"

    
    
    //MARK:  Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields(textField: topTextField, text: topText, font: defaultText)
        configureTextFields(textField: bottomTextField, text: bottomText, font: defaultText)
        imagePickerView.contentMode = .scaleAspectFit
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        shareButton.isEnabled = imagePickerView.image != nil
        subscribeToKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    
    
    //MARK:  Keyboard Functions for subscribing to keyboard notifications and shifting the view whenever the keyboard is brought in
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
        
    }
    @objc func keyboardWillShow(_ notification:Notification) {
        if bottomTextField.isFirstResponder {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    @objc func keyboardWillHide(_ notification:Notification) {
        view.frame.origin.y = 0
    }
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    
    
    
    
    //MARK: IBAction Functions
    //Album function for selecting an image from the device album
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
        pickAnImage(ofType: .photoLibrary)
    }
    //User selects to take a picture with the camera
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        pickAnImage(ofType: .camera)
    }
    //Functionn for when activity button is selected, calling the activityViewController
    @IBAction func activityButton(_ sender: Any) {
        let meme = generateMemedImage()
        let activityController = UIActivityViewController(activityItems: [meme], applicationActivities: nil)
        activityController.completionWithItemsHandler = { activity, success, items, error in
            if success {
                self.save()
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        present(activityController, animated: true, completion: nil)
    }
    //Cancel function button, resets the UI to initial state
    @IBAction func cancelButton(_ sender: Any) {
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
        imagePickerView.image = nil
        shareButton.isEnabled = false
        dismiss(animated: true, completion: nil)
    }
    @IBAction func chooseFontButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FontTableViewController") as! FontTableViewController
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
    
    
    //MARK:  Function for Action buttons
    func pickAnImage(ofType type: UIImagePickerControllerSourceType!) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = type
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    
    //MARK: Delegate functions
    //Function for Image Picker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imagePickerView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    
    
    //MARK: Generate the meme image function
    func generateMemedImage() -> UIImage {
        configureNavToolbars(isHidden: true)
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        configureNavToolbars(isHidden: false)
        return memedImage
    }
    
    
    
    //Mark:  Configuring text fields function
    func configureTextFields(textField: UITextField, text: String!, font: String!){
        textField.defaultTextAttributes = memeTextAttributes
        textField.textAlignment = .center
        textField.borderStyle = UITextBorderStyle.none
        textField.backgroundColor = UIColor.clear
        textField.delegate = textFieldDelegate
        textField.text = text
        textField.font = UIFont(name: font, size: 40)!
    }
    
    
    
    //MARK: Configure the navigation tool bars for creating the meme image.
    func configureNavToolbars (isHidden: Bool) {
        topToolbar.isHidden = isHidden
        bottomToolbar.isHidden = isHidden
    }
    
    
    
    //MARK: Save function for saving the meme
    func save() {
        let meme = Meme(topTextField: topTextField.text!, bottomTextField: bottomTextField.text!, originalImage: imagePickerView.image!, memedImage: generateMemedImage())
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
    }
    func setFont (font: String) {
        configureTextFields(textField: topTextField, text: topTextField.text, font: font)
        configureTextFields(textField: bottomTextField, text: bottomTextField.text, font: font)
    }
}
