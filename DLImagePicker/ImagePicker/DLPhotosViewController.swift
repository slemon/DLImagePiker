//
//  DLPhotosViewController.swift
//  DLImagePicker
//
//  Created by Dalong on 2017/11/23.
//  Copyright © 2017年 Dalong. All rights reserved.
//

import UIKit
import Photos

var picCollectionView : UICollectionView!
var dataArr = NSMutableArray()

let screenWidth  = UIScreen.main.bounds.width;
let screenHeight = UIScreen.main.bounds.height;

class DLPhotosViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        loadData()
        
        initView()
        
        initDismissButton()
    }
    
    func initDismissButton() {
        
        let dismissButton = UIButton.init(type: UIButtonType.system)
        dismissButton.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        dismissButton.addTarget(self, action: #selector(controllerDimiss), for: .touchUpInside)
        dismissButton.setTitle("取消", for: .normal)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: dismissButton)
    }
    
    @objc func controllerDimiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func initView () {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        let ItemWidth = (screenWidth - 15)/4;
        layout.itemSize = CGSize(width: ItemWidth, height: ItemWidth)
        
        picCollectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight), collectionViewLayout: layout)
        picCollectionView.register(DLPicCollectionViewCell.self, forCellWithReuseIdentifier:"cell")
        picCollectionView.delegate = self;
        picCollectionView.dataSource = self;
        picCollectionView.backgroundColor = UIColor.white
        view.addSubview(picCollectionView!)
    }
    
    func loadData() {
        
        for _ in 0...10 {
            dataArr.add("Tomcat")
            dataArr.add("Jetty")
            dataArr.add("Apache")
            dataArr.add("Jboss")
        }
    }
    
    //MARK: - CollectionDelegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DLPicCollectionViewCell
        collectionViewCell.titleLabel?.text = (dataArr[indexPath.item] as! String)
        return collectionViewCell;
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
