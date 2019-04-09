//
//  CommentCell.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 9/4/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    static let nibFile = UINib(nibName: "CommentCell", bundle: .main)
    static let identifier = "CommentCell"

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    func setUpCell(comment: CommentResponse) {
        if let imageUrl = comment.user?.profileImageUrl {
            profileImage.setCircularImage(urlStr: imageUrl, borderWidth: 0, borderColor: .Clear)
        }
        nameLabel.text = comment.user?.displayName ?? "N/A"
        messageLabel.text = comment.content ?? "N/A"
        dateTimeLabel.text = AnidesuConverter.convertDate(dateString: comment.date!, toFormat: .displayComment, formFormat: .databaseComment)
    }
    
}
