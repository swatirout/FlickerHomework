//
//  CustomLayOut.swift
//  FlickerDemo
//
//  Created by Swati Rout on 12/08/18.
//  Copyright © 2018 Swati Rout. All rights reserved.
//
import UIKit
class CustomLayOut: UICollectionViewFlowLayout {
    private var numberOfColumns: Int = 3
    init(numberOfColumns: Int) {
        super.init()
        minimumLineSpacing = 1
        minimumInteritemSpacing = 1
        self.numberOfColumns = numberOfColumns
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var itemSize: CGSize {
        get {
            if let collectionView = collectionView {
                let itemWidth: CGFloat = (collectionView.frame.width/CGFloat(self.numberOfColumns)) - self.minimumInteritemSpacing
                let itemHeight: CGFloat = 100.0
                return CGSize(width: itemWidth, height: itemHeight)
            }
            // Default fallback
            return CGSize(width: 100, height: 100)
        }
        set {
            super.itemSize = newValue
        }
    }
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        if let collectionView = collectionView {
            return collectionView.contentOffset
        }
        return CGPoint.zero
    }
    
    
}
