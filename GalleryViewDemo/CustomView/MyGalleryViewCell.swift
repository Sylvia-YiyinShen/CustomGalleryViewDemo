//
//  MyCollectionViewCell.swift
//  GalleryViewDemo
//
//  Created by Yiyin Shen on 11/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class MyGalleryViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}

extension MyGalleryViewCell: GalleryViewCellProtocol {
    func configure(with model: GalleryViewCellModelProtocol) {
        if let model = model as? MyGalleryViewCellModel {
            imageView.image = UIImage(named: model.imageName)
        }
    }
}
