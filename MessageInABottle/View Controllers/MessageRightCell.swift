//
//  MessageCell.swift
//  MessageInABottle
//
//  Created by Sam DuBois on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import UIKit

class MessageRightCell: UITableViewCell {
    
    let bubbleView: PaddingLabel = {
        let label = PaddingLabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.addSubview(bubbleView)
        
        NSLayoutConstraint.activate([
        
            bubbleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            bubbleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            bubbleView.leftAnchor.constraint(greaterThanOrEqualTo: self.centerXAnchor, constant: 10),
            bubbleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        
        ])
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
