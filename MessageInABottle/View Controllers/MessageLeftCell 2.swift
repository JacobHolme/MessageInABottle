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
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 15)
        return label
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.addSubview(bubbleView)
        self.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            
            nameLabel.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: 5),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
        
            bubbleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            bubbleView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            bubbleView.rightAnchor.constraint(lessThanOrEqualTo: self.centerXAnchor, constant: 10),
            bubbleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
