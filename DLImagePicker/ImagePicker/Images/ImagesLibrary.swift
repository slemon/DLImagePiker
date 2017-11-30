//
//  ImagesLibrary.swift
//  DLImagePicker
//
//  Created by Dalong on 2017/11/30.
//  Copyright © 2017年 Dalong. All rights reserved.
//

import UIKit
import Photos


class ImagesLibrary: NSObject {
    
    var items : [PHAsset] = []

    public func getImageImageAssets() -> [PHAsset] {
        
//        let collection = PHAssetCollection()
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true )]
        
        let fetchResult =  PHAsset.fetchAssets(with: fetchOptions)
        
        fetchResult.enumerateObjects { (assets, _, _) in
            self.items.append(assets)
        }
        
        return items
    }
    
    
}
