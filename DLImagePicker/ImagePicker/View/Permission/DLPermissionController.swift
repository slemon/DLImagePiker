//
//  DLPermissionController.swift
//  DLImagePicker
//
//  Created by Dalong on 2017/11/28.
//  Copyright © 2017年 Dalong. All rights reserved.
//

import UIKit

class DLPermissionController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        if DLPhotoPermission.Photos.status == .notDetermind {

            self.check()
            
            return;
        }
        
        
    }
    
    func check() {
        DLPhotoPermission.Photos.request { [weak self] in
            self?.check()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
