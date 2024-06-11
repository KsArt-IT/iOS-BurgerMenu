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
    private var postDelegate: PostDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewParameters()

        showPost(post)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        picturePost.animateCorner()
    }

    public func configure(_ post: FoodPost, _ postDelegate: PostDelegate) {
        self.post = post
        self.postDelegate = postDelegate
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
        print("Нажал")
    }

    @IBAction func saveButtonClick(_ sender: Any) {
        if let post = self.post, let postDelegate = postDelegate {
            let postUpdate = FoodPost(
                name: titlePost?.text ?? "",
                picture: picturePost.image,
                description: descriptionPost.text,
                price: post.price,
                count: post.count
            )
            postDelegate.update(postUpdate)
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
