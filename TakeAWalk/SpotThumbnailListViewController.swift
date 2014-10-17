//
//  SpotThumbnailListViewController.swift
//  TakeAWalk
//
//  Created by Kenzo on 2014/10/16.
//  Copyright (c) 2014年 Kenzo. All rights reserved.
//

import UIKit
import Foundation

class SpotThumbnailListViewController : UICollectionViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var carImages : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.registerClass(SpotThumbnailViewCell.classForCoder(), forCellWithReuseIdentifier: "ThumbnailViewCell")
        
        //var myFlowLayout: MyFlowLayout = MyFlowLayout()
        //self.collectionView?.setCollectionViewLayout(myFlowLayout, animated: true)
        
        self.carImages = [
            "test1.png",
            "test2.png",
            "test3.png",
            "test4.png",
            "test5.png"]
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.carImages.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //var cell = collectionView.dequeueReusableCellWithReuseIdentifier("ThumbnailViewCell", forIndexPath: indexPath)
        var cell : SpotThumbnailViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("ThumbnailViewCell", forIndexPath: indexPath) as SpotThumbnailViewCell
        var image : UIImage
        var row : Int = indexPath.row
        image = UIImage(named: self.carImages[row])
        cell.imageView.image = image
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var row: Int = indexPath.row
        self.carImages.removeAtIndex(row)
        var deletions: NSArray = [indexPath]
        self.collectionView?.deleteItemsAtIndexPaths(deletions)
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var header : MySupplementaryView? = nil
        if (kind == UICollectionElementKindSectionHeader) {
            header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "MyHeader", forIndexPath: indexPath)
                as? MySupplementaryView
            header?.headerLabel.text = "Car Image Gallery"
        }
        return header!
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var row : Int = indexPath.row
        var image : UIImage = UIImage(named: self.carImages[row])
        return image.size
    }
    
}
