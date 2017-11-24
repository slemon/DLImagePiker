//
//  DLPicCollectionViewCell.swift
//  DLImagePicker
//
//  Created by Dalong on 2017/11/24.
//  Copyright © 2017年 Dalong. All rights reserved.
//

import UIKit

class DLPicCollectionViewCell: UICollectionViewCell {
    
    var titleLabel : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.yellow
        
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        titleLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: 100, height: 20))
        addSubview(titleLabel!)
    }
    
    
}
