//
//  SpotThumbnailListViewController.swift
//  TakeAWalk
//
//  Created by Kenzo on 2014/10/16.
//  Copyright (c) 2014年 Kenzo. All rights reserved.
//

import UIKit
import Foundation

class SpotThumbnailListViewController : UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var images : [String] = []
    var collectionView : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var frame : CGRect = CGRect()
        frame.origin.x = 0
        frame.origin.y = 300
        frame.size.width = self.view.frame.size.width
        frame.size.height = 100
        self.view.frame = frame
        
//        var myFlowLayout: MyFlowLayout = MyFlowLayout()
//        self.collectionView?.setCollectionViewLayout(myFlowLayout, animated: true)
        
//        self.collectionView?.registerClass(SpotThumbnailViewCell.classForCoder(), forCellWithReuseIdentifier: "ThumbnailViewCell")
//        var frame : CGRect = CGRect()
//        frame.origin.x = 0
//        frame.origin.y = 300
//        frame.size.width = self.view.frame.size.width
//        frame.size.height = 100
//        self.collectionView?.frame = frame
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 120)
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collectionView!.dataSource = self
        self.collectionView!.delegate = self
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "ThumbnailViewCell")
        self.collectionView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.collectionView!)
        
        self.images = [
            "img/test1.png",
            "img/test2.png",
            "img/test3.png",
            "img/test4.png",
            "img/test5.png"]
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell : SpotThumbnailViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("ThumbnailViewCell", forIndexPath: indexPath) as SpotThumbnailViewCell
        var image : UIImage
        var row : Int = indexPath.row
        image = UIImage(named: self.images[row])
        cell.imageView.image = image
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var row: Int = indexPath.row
        self.images.removeAtIndex(row)
        var deletions: NSArray = [indexPath]
        self.collectionView?.deleteItemsAtIndexPaths(deletions)
    }
    
//    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//        var header : MySupplementaryView? = nil
//        if (kind == UICollectionElementKindSectionHeader) {
//            header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "MyHeader", forIndexPath: indexPath)
//                as? MySupplementaryView
//            header?.headerLabel.text = "Car Image Gallery"
//        }
//        return header!
//    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var row : Int = indexPath.row
        var image : UIImage = UIImage(named: self.images[row])
        return image.size
    }
    
}
