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
    @IBOutlet weak var captionPost: UITextField!
    @IBOutlet weak var editPost: UIButton!
    
    private let cornerRadius: CGFloat = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captionPost.layer.cornerRadius = cornerRadius
        editPost.layer.cornerRadius = cornerRadius
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateCorner()
    }
    
    private func animateCorner(){
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [.autoreverse,.repeat]) {[weak self] in
            self?.picturePost.layer.cornerRadius = self?.cornerRadius ?? 0
        }
    }
    
    @IBAction func editPostTouch(_ sender: Any) {
    }
}
