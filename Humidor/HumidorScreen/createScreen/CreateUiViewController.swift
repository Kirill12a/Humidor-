//
//  CreateUiViewController.swift
//  Humidor
//
//  Created by Kirill Drozdov on 26.01.2022.
//

import UIKit
import SnapKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class CreateUiViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate
{

  var imagePicker = UIImagePickerController()


  lazy var nameSigarTF: MDCOutlinedTextField =
  {
    let name = MDCOutlinedTextField()
    name.label.text = "Phone number"
    name.placeholder = "555-555-5555"
    name.leadingAssistiveLabel.text = "This is helper text"
    name.sizeToFit()
    return name
  }()


  lazy var shoppingPlaceTF: MDCOutlinedTextField = {
    let place = MDCOutlinedTextField()
    place.label.text = "Phone number"
    place.placeholder = "555-555-5555"
    place.leadingAssistiveLabel.text = "This is helper text"
    place.sizeToFit()
    return place
  }()


  lazy var yearOfPurchaseTF: MDCOutlinedTextField = {
    let year = MDCOutlinedTextField()
    year.label.text = "Phone number"
    year.placeholder = "555-555-5555"
    year.leadingAssistiveLabel.text = "This is helper text"
    year.sizeToFit()
    return year
  }()


  lazy var sigarImage: UIImageView =
  {
    var image = UIImageView()
    image.backgroundColor = .white
    image.layer.borderColor = UIColor.gray.cgColor
    image.layer.borderWidth = 3
    return image
  }()


  lazy var addSigarImageButton: UIButton =
  {
    let button = UIButton(type: .system)
    button.setTitle("Open gallery", for: .normal)
    button.addTarget(self, action: #selector(btnChooseImageOnClick), for: .touchUpInside)
    return button
  }()




  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .green
    configuration()
    
  }




  private func configuration ()
  {
    view.addSubview(nameSigarTF)
    nameSigarTF.snp.makeConstraints { make in
      make.centerY.equalToSuperview().offset(-40)
      make.centerX.equalToSuperview()
      make.width.height.equalTo(200)
    }

    view.addSubview(shoppingPlaceTF)
    shoppingPlaceTF.snp.makeConstraints { make in
      make.centerY.equalToSuperview().offset(40)
      make.centerX.equalToSuperview()
      make.width.height.equalTo(200)
    }

    view.addSubview(yearOfPurchaseTF)
    yearOfPurchaseTF.snp.makeConstraints { make in
      make.centerY.equalToSuperview().offset(150)
      make.centerX.equalToSuperview()
      make.width.height.equalTo(200)
    }

    view.addSubview(sigarImage)
    sigarImage.snp.makeConstraints { make in
      make.centerY.equalToSuperview().offset(250)
      make.centerX.equalToSuperview()
      make.width.height.equalTo(200)
    }

    view.addSubview(addSigarImageButton)
    addSigarImageButton.snp.makeConstraints { make in
      make.centerY.equalToSuperview().offset(-200)
      make.centerX.equalToSuperview()
      make.width.height.equalTo(100)
    }
  }

  @objc func btnChooseImageOnClick(_ sender: UIButton)
  {


    let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
           alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
               self.openCamera()
           }))

           alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
               self.openGallery()
           }))

           alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))

           self.present(alert, animated: true, completion: nil)




  }




    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }


    func openGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }


    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            // imageViewPic.contentMode = .scaleToFill
          sigarImage.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
