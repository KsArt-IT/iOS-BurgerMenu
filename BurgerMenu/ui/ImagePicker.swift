//
//  ImagePicker.swift
//  PhotoPicker
//
//  Created by KsArT on 12.06.2024.
//

import UIKit

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    typealias IPCSourceType = UIImagePickerController.SourceType

    private var picker: UIImagePickerController?
    private var completion: ((UIImage) -> Void)?

    func showAndTake(in viewController: UIViewController, source: IPCSourceType = .photoLibrary, editing: Bool = false, completion: ( (UIImage) -> Void)? = nil) {
        self.completion = completion

        picker = UIImagePickerController()

        picker?.delegate = self
        picker?.sourceType = source
        picker?.allowsEditing = editing

        viewController.present(picker!, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker.allowsEditing, let image = info[.editedImage] as? UIImage {
            self.completion?(image)
        } else if let image = info[.originalImage] as? UIImage {
            self.completion?(image)
        }

        picker.dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }

}
