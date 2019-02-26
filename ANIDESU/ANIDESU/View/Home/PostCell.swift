//
//  PostCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit
import WCLShineButton

protocol PostCellDidTapDelegate {
    func likeBtnDidTap()
    func commentBtnDidTap(indexPath: IndexPath)
}

class PostCell: UITableViewCell {
    static let nibFile = UINib(nibName: "PostCell", bundle: .main)
    static let identifier = "PostCell"

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var likeButton: WCLShineButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var seperatorView: UIView!
    
    @IBOutlet weak var bgViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var bgViewRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bgViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var bgViewLeftConstraint: NSLayoutConstraint!
    
    var postCellDidTapDelegate: PostCellDidTapDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpCell(post: PostResponse, useFrame: Bool) {
        if let user = post.user, let imageUrl = post.user?.profileImageUrl {
            profileImageView.setCircularImage(urlStr: imageUrl, borderWidth: 1, borderColor: .Clear)
            displayNameLabel.text = user.displayName ?? "-"
            postDateLabel.text = post.date ?? "-"
            contentLabel.text = post.content ?? "-"
            likeCountLabel.text = "\(post.likeCount!) Likes"
        }
        
        likeButton.addTarget(self, action: #selector(likeBtnPressed), for: .valueChanged)
        seperatorView.isHidden = true

        if useFrame {
            setUpBorder()
        } else {
            bgViewBottomConstraint.constant = 0
            bgViewRightConstraint.constant = 0
            bgViewTopConstraint.constant = 0
            bgViewLeftConstraint.constant = 0
            seperatorView.isHidden = false
        }
    }

    private func setUpBorder() {
        bgView.layer.shadowColor = AnidesuColor.Black.color().cgColor
        bgView.layer.shadowOffset = CGSize(width: 0, height: 5)
        bgView.layer.shadowOpacity = 0.1
        bgView.layer.shadowRadius = 5
    }

    @objc func likeBtnPressed() {
        self.postCellDidTapDelegate?.likeBtnDidTap()
    }
    
    @IBAction func commentButtonTapped(_ sender: Any) {
    }
}
