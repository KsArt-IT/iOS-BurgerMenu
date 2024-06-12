//
//  EditPostViewController.swift
//  BurgerMenu
//
//  Created by KsArT on 10.06.2024.
//

import UIKit

class EditPostViewController: UIViewController {

    @IBOutlet weak var picturePost: UIImageView!
    @IBOutlet weak var titlePost: UITextField!
    @IBOutlet weak var descriptionPost: UITextView!

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!

    private var post: FoodPost?
    private weak var completion: PostEditDelegate?
    private let picker = ImagePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewParameters()

        showPost(post)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        picturePost.animateCorner()
    }

    public func configure(_ post: FoodPost, _ postDelegate: PostEditDelegate) {
        self.post = post
        self.completion = postDelegate
    }

    private func initViewParameters() {
        descriptionPost.applyBorderStyle()
        setGradientToButtons()
    }

    private func setGradientToButtons() {
        saveButton.applyGradient()
        cancelButton.applyGradient()
    }

    @IBAction func changePictureClick(_ sender: Any) {
        picker.showAndTake(in: self) { [weak self] image in
            self?.picturePost.image = image
        }
    }

    @IBAction func saveButtonClick(_ sender: Any) {
        if let post = self.post, let completion = self.completion {
            let postUpdate = FoodPost(
                name: titlePost?.text ?? "",
                picture: picturePost.image,
                description: descriptionPost.text,
                price: post.price,
                count: post.count
            )
            completion.update(postUpdate)
            back()
        }
    }

    @IBAction func cancelButtonClick(_ sender: Any) {
        back()
    }

    private func back() {
        self.navigationController?.popViewController(animated: true)
    }

    private func showPost(_ post: FoodPost?) {
        guard let post = post else { return }

        titlePost.text = post.name
        picturePost.image = post.picture
        descriptionPost.text = post.description
    }

}
