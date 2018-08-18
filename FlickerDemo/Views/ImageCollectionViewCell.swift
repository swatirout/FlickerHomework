//
//  ImageCollectionViewCell.swift
//  FlickerDemo
//
//  Created by Swati Rout on 12/08/18.
//  Copyright © 2018 Swati Rout. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet  weak var imageView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: contentView.bounds)
        contentView.addSubview(imageView)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func getImage(urlString:String,collectionView:UICollectionView,indexpath:IndexPath){
        self.imageView.imageFromServerURL(urlString: urlString, collectionview: collectionView, indexpath: indexpath)
    }
    }
