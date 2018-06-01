//
//  AddContact+imagePicker.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension AddContactController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //Upload contact image
    @objc func handleImagePicker(){
        //Network indicator
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            self.contactImage.image = selectedImage
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        dismiss(animated: true, completion: nil)
    }
}
