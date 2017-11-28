//
//  DLPhotoPermission.swift
//  DLImagePicker
//
//  Created by Dalong on 2017/11/28.
//  Copyright © 2017年 Dalong. All rights reserved.
//

import UIKit
import Photos

struct DLPhotoPermission {
    
    enum Status {
        case notDetermind
        case authorized
        case restricted
        case denied
    }
    
    struct Photos {
        
        static var status : Status {
            switch PHPhotoLibrary.authorizationStatus() {
            case .notDetermined:
                return .notDetermind
            case .authorized:
                return .authorized
            case .restricted:
                return .restricted
            case .denied:
                return .denied
            }
        }
        
        static func request(_ completion : @escaping () -> Void) {
            PHPhotoLibrary.requestAuthorization { _ in
                completion()
            }
        }
        
    }
}
