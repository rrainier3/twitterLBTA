//
//  Cells.swift
//  twitterLBTA
//
//  Created by RayRainier on 1/15/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import LBTAComponents

let twitterBlue = UIColor(r: 61, g: 167, b: 244)

class UserFooter: DatasourceCell {

    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont(name: "FreightSans Bold", size: 15)
        label.textColor = twitterBlue
        
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        //backgroundColor = .green
    }
}

class UserHeader: DatasourceCell {

	let textLabel: UILabel = {
       let label = UILabel()
       label.text = "WHO TO FOLLOW"
       label.font = UIFont(name: "FreightSans Bold", size: 16)
       return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        //backgroundColor = .blue
    }
}

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
//            nameLabel.text = datasourceItem as? String
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ashley")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ashley McFadden"
        //label.font = UIFont.boldSystemFont(ofSize: 16)
        //label.font = UIFont(name: "FreightSans Bold", size: 16)
        label.font = UIFont(name: "FreightSans Bold", size: 16)
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@letsbuildthatapp"
        //label.font = UIFont.boldSystemFont(ofSize: 14)
        label.font = UIFont(name: "ProximaNova-Light", size: 12)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!  This is a great time to learn new programming languages that are best suited for web and internet development."
        textView.font = UIFont(name: "SF-UI-Display-Regular", size: 14)
        // if the background is blocking (white) subviews set .clear
        textView.backgroundColor = .clear
        return textView
    }()
    
    let followButton: UIButton = {

        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = twitterBlue.cgColor
        //button.layer.borderColor = UIColor.cyan.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(twitterBlue, for: .normal)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        // you can also change or adjust
        // button.titleEdgeInsets = UIEdgeInsets
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        //backgroundColor = .yellow
        
        // Add the Subviews to UserCell
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
    
}
