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
    @IBOutlet weak var descriptionPost: UITextView!
    
    @IBOutlet weak var previosButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var editButton: UIButton!

    private var foodPost: FoodPost?

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewParameters()
        showPost(FoodData.getNext())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        picturePost.animateCorner()
    }
    
    private func initViewParameters() {
        self.title = ""
        self.navigationItem.backButtonTitle = "Back"
        descriptionPost.applyBorderStyle()
        setGradientToButtons()
    }
    
    private func setGradientToButtons() {
        previosButton.applyGradient()
        nextButton.applyGradient()
        editButton.applyGradient()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditPost" {
            if let vc = segue.destination as? EditPostViewController, let post = foodPost {
                vc.configure(post, self)
            }
        }
    }

    @IBAction func goToPreviosPost(_ sender: Any) {
        showPost(FoodData.getPrivios())
    }
    
    @IBAction func goToNextPost(_ sender: Any) {
        showPost(FoodData.getNext())
    }
    
    private func showPost(_ post: FoodPost?) {
        guard let post = post else { return }

        self.foodPost = post

        self.navigationItem.backButtonTitle = post.name

        titlePost.text = post.name
        picturePost.image = post.picture
        descriptionPost.text = post.description
    }

}

extension PostViewController: PostDelegate {

    func update(_ post: FoodPost) {
        showPost(FoodData.updateCurrentPost(post))
    }
}

protocol PostDelegate: NSObject {
    func update(_ post: FoodPost)
}
