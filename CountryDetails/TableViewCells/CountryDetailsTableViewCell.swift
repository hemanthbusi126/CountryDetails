//
//  CountryDetailsTableViewCell.swift
//  CountryDetails
//
//  Created by Hemanth on 27/01/20.
//  Copyright © 2020 Hemanth. All rights reserved.
//

import UIKit

class CountryDetailsTableViewCell: UITableViewCell {
    
    var countryImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
        var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 1
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 256), for: .vertical) // 252
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 745), for: .vertical) //749
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(countryImageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        setUPImageConstraints()
        setUPTitleConstraints()
        setUPDescriptionConstraints()
//        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        countryImageView.image = nil
    }
    
    fileprivate func setUpCell() {
        titleLabel.text = "has not been implemented"
        descriptionLabel.text = "has not been implementedhas not been implementedhas not been implementedhas not been implementedhas not been implementedhas not been implemented"
    }
    
   
    fileprivate func setUPImageConstraints() {
        countryImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        countryImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        countryImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        countryImageView.widthAnchor.constraint(equalTo: countryImageView.heightAnchor ,constant: 16/9).isActive = true
        countryImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setUPTitleConstraints() {
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: countryImageView.trailingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
    
    fileprivate func setUPDescriptionConstraints() {
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: countryImageView.trailingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
}

