//
//  MessageCell.swift
//  MessageInABottle
//
//  Created by Sam DuBois on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import UIKit

class MessageRightCell: UITableViewCell {
    
    let bubbleView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        label.layer.cornerRadius = 10
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        NSLayoutConstraint.activate([
        
            bubbleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            bubbleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            bubbleView.rightAnchor.constraint(lessThanOrEqualTo: self.centerXAnchor, constant: 10)
        
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
