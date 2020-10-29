//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    private var imageTitle = UILabel()

    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        setUpSubviews()
    }
    
    private func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData, scale: 1)
        imageTitle.text = photo.title
    }
    
    private func setUpSubviews() {
        // image view

        // 1. create / configure
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        // 2. add to view hierarchy
        self.addSubview(imageView)
        // 3. create / activate constraints
        //y
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 4).isActive = true
        // x
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 4).isActive = true
        // w
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -4).isActive = true
        // h
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        // label
        
        // 1. create / configure
        imageTitle.translatesAutoresizingMaskIntoConstraints = false
        imageTitle.textAlignment = .center
        // 2. add to view hierarchy
        self.addSubview(imageTitle)
        // 3. create / activate constraints
        // y
        NSLayoutConstraint(item: imageTitle,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 4).isActive = true
        // x
        NSLayoutConstraint(item: imageTitle,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        // w
        NSLayoutConstraint(item: imageTitle,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -2).isActive = true
    }
    
}
