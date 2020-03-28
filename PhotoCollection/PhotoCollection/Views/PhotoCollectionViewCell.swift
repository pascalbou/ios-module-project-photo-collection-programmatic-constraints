//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    private var imageView: UIImageView!
    private var label: UILabel!
    
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
        super.init(coder: coder)
        setUpSubviews()
    }
    
    private func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        label.text = photo.title
    }
    
    private func setUpSubviews() {
        guard let photo = photo else { return }
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit

        self.addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
//        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        self.imageView = imageView
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = photo.title
        
        self.addSubview(label)
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0).isActive = true
        
        self.label = label
    }
    
}
