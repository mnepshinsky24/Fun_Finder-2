//
//  AddPhotoViewController.swift
//  Fun_Finder
//
//  Created by Apple on 5/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

var imagePicker = UIImagePickerController()

@IBOutlet weak var newImage: UIImageView!
@IBOutlet weak var newCaption: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage.image = selectedImage
        }
        imagePicker.dismiss(animated:true, completion:nil)
    }
        
    @IBAction func photoAlbum(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
            photoToSave.caption = newCaption.text
            
            if let userImage = newImage.image {
                
                if let userImageData = userImage.pngData() {
                    photoToSave.imageData = userImageData

    imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
    }
            }
    
    @IBAction func photoLibrary(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func camera(_ sender: UIButton) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    


    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

