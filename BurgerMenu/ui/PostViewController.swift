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
    
    @IBOutlet weak var editSaveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    private var isPostEditing = false
    private let cornerRadius: CGFloat = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewParameters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateCorner()
    }
    
    private func initViewParameters() {
        captionPost.layer.cornerRadius = cornerRadius
        captionPost.layer.borderWidth = 1
        captionPost.layer.borderColor = UIColor.blue.withAlphaComponent(0.3).cgColor
        captionPostView.layer.cornerRadius = cornerRadius
        captionPostView.layer.borderWidth = 1
        captionPostView.layer.borderColor = UIColor.blue.withAlphaComponent(0.3).cgColor
        
        if let post = FoodData.getNext() {
            showPost(post)
        }
        captionPostView.text = ""
        isPostEditing = false
        showEditOrSavePost()
    }
    
    private func animateCorner(){
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [.autoreverse,.repeat]) { [weak self] in
            self?.picturePost.layer.cornerRadius = self?.cornerRadius ?? 0
        }
    }
    
    @IBAction func goToPreviosPost(_ sender: Any) {
        if let post = FoodData.getPrivios() {
            showPost(post)
        }
    }
    
    @IBAction func goToNextPost(_ sender: Any) {
        if let post = FoodData.getNext() {
            showPost(post)
        }
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
    
    private func showPost(_ post: FoodPost) {
        titlePost.text = post.name
        picturePost.image = UIImage(named: post.picture)
        captionPost.text = post.caption
    }
}
