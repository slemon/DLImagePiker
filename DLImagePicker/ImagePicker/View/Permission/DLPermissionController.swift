//
//  DLPermissionController.swift
//  DLImagePicker
//
//  Created by Dalong on 2017/11/28.
//  Copyright © 2017年 Dalong. All rights reserved.
//

import UIKit


class DLPermissionController: UIViewController {
    
    lazy var closeButton : UIButton = self.makeCloseButton()
    
    lazy var camerImageView : UIImageView = self.makeCamaraImageView()
    lazy var tipsLabel : UILabel = self.makeTipsLabel()
    lazy var settingButton : UIButton = self.makeSettingButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
    
        setup()
        
        if DLPhotoPermission.Photos.status == .notDetermind {
            self.check()
            return;
        }
    }
    
    override func viewDidLayoutSubviews() {
        
//        let camerImageViewbottom = camerImageView.bottom
        
        tipsLabel.top = camerImageView.bottom + 10;
        settingButton.top = tipsLabel.bottom + 20
    }
    
    func check() {
        DLPhotoPermission.Photos.request { [weak self] in
            self?.check()
        }
    }
    
    func setup () {
        [closeButton,tipsLabel,camerImageView,settingButton].forEach {
            view.addSubview($0)
        }
    }
    
    @objc func closetButtonAction () {
        dismiss(animated: true, completion: nil)
    }
    
    func makeCloseButton() -> UIButton {
        let closeButton = UIButton(type: .custom)
        closeButton.setTitle("关闭", for: .normal)
        closeButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        closeButton.addTarget(self, action: #selector(closetButtonAction), for: .touchUpInside)
        closeButton.backgroundColor = UIColor.yellow
        return closeButton
    }
    
    func makeSettingButton() -> UIButton {
        let settingButton = UIButton(type: .custom)
        settingButton.setTitle("去设置", for: .normal)
        settingButton.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        settingButton.backgroundColor = UIColor.blue
        settingButton.layer.cornerRadius = 5
        settingButton.titleLabel?.textColor = UIColor.black
        return settingButton
    }
    
    func makeCamaraImageView() -> UIImageView {
        let  imageView  = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 44, height: 44);
        imageView.image = UIImage.init(named: "Gallery.bundle/gallery_permission_view_camera")
        imageView.center = view.center
        return imageView
    }
    
    func makeTipsLabel() -> UILabel {
        let tipsLabel = UILabel()
        tipsLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
        tipsLabel.text = "Please grant accsses to photos and the camera"
        return tipsLabel
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
