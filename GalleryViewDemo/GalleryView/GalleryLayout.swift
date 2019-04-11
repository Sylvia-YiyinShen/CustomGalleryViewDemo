//
//  GalleryLayout.swift
//  GalleryViewDemo
//
//  Created by Yiyin Shen on 11/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import UIKit

class GalleryLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        let itemWidth: CGFloat = collectionView!.bounds.width * 0.6
        let itemHeight: CGFloat = collectionView!.bounds.height * 0.7
        itemSize = CGSize(width: itemWidth, height: itemHeight)
        scrollDirection = .horizontal
        minimumLineSpacing = collectionView!.bounds.width * 0.2
        let inset = (collectionView?.bounds.size.width ?? 0) * 0.15
        sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        
        let centerX = collectionView.contentOffset.x + collectionView.frame.size.width / 2
        let attributes = super.layoutAttributesForElements(in: rect)

        attributes?.forEach({ (attribute) in
            let widthScale = 1 + (1 - abs(attribute.center.x - centerX) / collectionView.frame.size.width) * 0.3
            let heightScale = 1 + (1 - abs(attribute.center.x - centerX) / collectionView.frame.size.width) * 0.4
            attribute.transform3D = CATransform3DMakeScale(widthScale, heightScale, 1.0)
        })
        
        return attributes
    }
}
