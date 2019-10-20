//
//  MessageLeftCell.swift
//  MessageInABottle
//
//  Created by Sam DuBois on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import UIKit

class MessageLeftCell: UITableViewCell {
    
    let bubbleView: PaddingLabel = {
        let label = PaddingLabel()
        label.text = " Message ksdjlsdkfj;sdfj;lkdasjf;lkdjsflsdkjfl;kdsalfads;lkfjadls;fkadslkfdsf"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override func didMoveToSuperview() {
        super.awakeFromNib()
        self.addSubview(bubbleView)
        
        NSLayoutConstraint.activate([
        
            bubbleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            bubbleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            bubbleView.rightAnchor.constraint(lessThanOrEqualTo: self.centerXAnchor, constant: 10),
            bubbleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
