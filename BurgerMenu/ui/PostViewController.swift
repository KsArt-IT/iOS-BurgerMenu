//
//  PostViewController.swift
//  BurgerMenu
//
//  Created by KsArT on 30.05.2024.
//

import UIKit

final class PostViewController: UIViewController {

    @IBOutlet weak var titlePost: UILabel!
    @IBOutlet weak var picturePost: UIImageView!
    @IBOutlet weak var captionPost: UILabel!
    @IBOutlet weak var captionPostView: UITextView!
    
    @IBOutlet weak var previosButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var editSaveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    private var isPostEditing = false

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewParameters()
        setGradientToButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateCorner()
    }
    
    private func initViewParameters() {
        captionPost.layer.cornerRadius = cornerRadius
        captionPost.layer.borderWidth = 1
        captionPost.layer.borderColor = AppColors.darkBlue.cgColor(alpha: 0.3)
        captionPostView.layer.cornerRadius = cornerRadius
        captionPostView.layer.borderWidth = 1
        captionPostView.layer.borderColor = AppColors.darkBlue.cgColor(alpha: 0.3)

        if let post = FoodData.getNext() {
            showPost(post)
        }
        captionPostView.text = ""
        isPostEditing = false
        showEditOrSavePost()
    }
    
    private func setGradientToButtons() {
        previosButton.applyGradient()
        nextButton.applyGradient()
        editSaveButton.applyGradient()
        cancelButton.applyGradient()
    }

    private func animateCorner(){
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [.autoreverse,.repeat]) { [weak self] in
            self?.picturePost.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBAction func goToPreviosPost(_ sender: Any) {
        showPost(FoodData.getPrivios())
    }
    
    @IBAction func goToNextPost(_ sender: Any) {
        showPost(FoodData.getNext())
    }
    
    @IBAction func editOrSavePost(_ sender: Any) {
        isPostEditing = !isPostEditing
        if !isPostEditing, let post = FoodData.updateCurrentPost(captionPostView.text) {
            showPost(post)
        }
        showEditOrSavePost()
    }
    
    @IBAction func cancelEditPost(_ sender: Any) {
        isPostEditing = false
        showEditOrSavePost()
    }
    
    private func showEditOrSavePost() {
        if isPostEditing {
            editSaveButton.setTitle("Save", for: .normal)
            captionPostView.text = captionPost.text
        } else {
            editSaveButton.setTitle("Edit", for: .normal)
            captionPostView.text = ""
        }
        captionPostView.isHidden = !isPostEditing
        cancelButton.isHidden = !isPostEditing
    }
    
    private func showPost(_ post: FoodPost?) {
        guard let post = post else { return }

        titlePost.text = post.name
        picturePost.image = UIImage(named: post.picture)
        captionPost.text = "  \(post.caption)  "

        if !captionPostView.isHidden {
            captionPostView.text = post.caption
        }
    }

}
