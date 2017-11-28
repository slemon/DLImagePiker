//
//  ViewController.swift
//  DLImagePicker
//
//  Created by Dalong on 2017/11/23.
//  Copyright © 2017年 Dalong. All rights reserved.
//

import UIKit

var permissionController : DLPermissionController = DLPermissionController()

class ViewController: UIViewController {
    
    var button : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button = UIButton.init(type: .system)
        button.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 20)
        button.setTitle("看图", for: UIControlState.normal)
        button.addTarget(self, action: #selector(popAlbum), for: .touchUpInside)
        
        button.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)

        view.addSubview(button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if (DLPhotoPermission.Photos.status != .authorized) {
            present(permissionController, animated: true, completion: nil)
        }else {
            popAlbum()
        }
        
    }

    @objc func popAlbum() {
        
        let navigationController = UINavigationController.init(rootViewController: DLPhotosViewController())
        present(navigationController, animated: true, completion: nil)
        
        print("button 被点击了！！")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

