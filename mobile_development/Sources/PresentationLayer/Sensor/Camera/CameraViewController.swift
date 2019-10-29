//
//  CameraViewController.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 14.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
  
  // MARK: IBOutlets
  @IBOutlet private var imageView: UIImageView!
  @IBOutlet private var takePhotoButton: UIButton!
  @IBOutlet private var openPhotoLibraryButton: UIButton!
  
  // MARK: Properties
  private(set) var image: UIImage?
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  // MARK: IBActions
  @IBAction private func takePhotoAction(_ sender: UIButton) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.sourceType = .camera
    imagePickerController.delegate = self
    imagePickerController.showsCameraControls = true
    present(imagePickerController, animated: true, completion: nil)
  }
  
  @IBAction private func openPhotoLibrary(_ sender: UIButton) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.sourceType = .photoLibrary
    imagePickerController.delegate = self
    present(imagePickerController, animated: true, completion: nil)
  }
  
  // MARK: Methods
  private func showImage(_ image: UIImage) {
    imageView.image = image
  }
  
  private func configureUI() {
    takePhotoButton.setTitle(translateFor(key: .CameraTakePhotoButton).capitalized, for: .normal)
    openPhotoLibraryButton.setTitle(translateFor(key: .CameraOpenPhotoLibrary).capitalized, for: .normal)
  }
  
}

// MARK: - UIImagePickerControllerDelegate
extension CameraViewController: UIImagePickerControllerDelegate {
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let internalImage = info[.originalImage] as? UIImage else {
      return
    }
    showImage(internalImage)
    
    if picker.sourceType == .camera {
      UIImageWriteToSavedPhotosAlbum(internalImage, nil, nil, nil)      
    }
    
    dismiss(animated: true, completion: nil)
  }
  
}

// MARK: - UINavigationControllerDelegate
extension CameraViewController: UINavigationControllerDelegate { }

// MARK: - StoryboardInstantiatable
extension CameraViewController: StoryboardInstantiatable {
  
  static var storyboardName: String {
    return StoryboardNamed.main.description
  }
  
}
