//
//  GalleryView.swift
//  GalleryViewDemo
//
//  Created by Yiyin Shen on 11/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import UIKit

class GalleryView: UIView {
    private var collectionView: UICollectionView?
    private var layout = GalleryLayout()
    private var colors = [UIColor.red, UIColor.black, UIColor.blue]
    private var cellModels: [GalleryViewCellModelProtocol]?
    private var cellNib: UINib?
    private var galleryBackgroundColor: UIColor?
    
    func configure(models: [GalleryViewCellModelProtocol], customCellNib: UINib, backgroundColor: UIColor = UIColor.black) {
        cellModels = models
        cellNib = customCellNib
        galleryBackgroundColor = backgroundColor
        configureCollectionView()
    }
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(cellNib, forCellWithReuseIdentifier: "Cell")
        collectionView?.backgroundColor = galleryBackgroundColor
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        addSubview(collectionView!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView?.frame = bounds
    }
}

extension GalleryView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        if let galleryCell = cell as? GalleryViewCellProtocol,
            let model = cellModels?[indexPath.row] {
            galleryCell.configure(with: model)
        }
        return cell
    }
}
