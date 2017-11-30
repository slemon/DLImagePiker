//
//  DLPicCollectionViewCell.swift
//  DLImagePicker
//
//  Created by Dalong on 2017/11/24.
//  Copyright © 2017年 Dalong. All rights reserved.
//

import UIKit
import Photos


class DLPicCollectionViewCell: UICollectionViewCell {
    
    var titleLabel : UILabel!
    
    lazy var imageView : UIImageView = self.getImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.yellow
        
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confiureItem(_ assets : PHAsset) -> Void {
        
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        
        PHImageManager.default().requestImage(for: assets, targetSize: self.frame.size, contentMode: .aspectFill, options: nil) { [weak self] (image, _) in
            self?.imageView.image = image
        }
        
    }
    
    
    func initView() {
        titleLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: 100, height: 20))
        addSubview(titleLabel)
        
        addSubview(imageView)
        
    }
    
    
    func getImageView () -> UIImageView {
        let imageView = UIImageView()
        imageView.frame = self.bounds
        return imageView
    }
    
}
