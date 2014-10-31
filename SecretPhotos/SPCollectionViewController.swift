//
//  SPCollectionViewController.swift
//  SecretPhotos
//
//  Created by Mark on 14-9-29.
//  Copyright (c) 2014 Mark. All rights reserved.
//

import UIKit
import Photos


let reuseIdentifier = "PhotoCell"

class SPCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegate {

    
    var allImages: [UIImage] = []
    //var allImages: NSArray = NSArray()
    
    
    
    @IBOutlet var spCollectionView: UICollectionView!
    
    @IBAction func importClicked(sender: AnyObject) {
        var alertController: UIAlertController = UIAlertController(title: "选择图片库", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        var actionFromSystemPhoto: UIAlertAction = UIAlertAction(title: "从系统相册选取", style: UIAlertActionStyle.Default){ (action: UIAlertAction!) -> Void in
            
            // show the ui image picker
            var imageArray: [UIImage] = []
            var imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            
            println(imagePickerController)
            
            self.presentViewController(imagePickerController, animated: true, completion: nil)
            
            
            
            // use CTAssetsPickerController
//            var ctAssetsPickerController: CTAssetsPickerController = CTAssetsPickerController()
//            ctAssetsPickerController.delegate = self
//            self.presentViewController(ctAssetsPickerController, animated: true, completion: nil)
            
        }
        
        var actionCancel: UIAlertAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertController.addAction(actionFromSystemPhoto)
        alertController.addAction(actionCancel)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    // delegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        var selectedImage: UIImage = info["UIImagePickerControllerOriginalImage"] as UIImage
        allImages.append(selectedImage)
        spCollectionView.reloadData()
        
        println(info.indexForKey(UIImagePickerControllerOriginalImage))
        
    }
    
//    func assetsPickerController(picker: CTAssetsPickerController!, didFinishPickingAssets assets: [AnyObject]!) {
//        
//        picker.dismissViewControllerAnimated(true, completion: nil)
//        
//        self.allImages = assets
//        
//        
//        spCollectionView.reloadData()
//        
//        println("--------")
//        println(allImages)
//        
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        println("segue---------")
        if segue.identifier == "PhotoDetailSegue" {
            
            var selectedIndexPath: NSIndexPath = self.spCollectionView.indexPathsForSelectedItems()![0] as NSIndexPath
            
            
            var cell: SPCollectionViewCell = self.spCollectionView.cellForItemAtIndexPath(selectedIndexPath) as SPCollectionViewCell
            
            var photoDetailController: SPPhotoDetailViewController = segue.destinationViewController as SPPhotoDetailViewController
            
            println(cell.imagePhotoView.image)
            
            var photoImage: UIImage = cell.imagePhotoView.image!
            
            photoDetailController.setValue(photoImage, forKey: "photoImage")
            
        }
        
    }
    
    
    
    func getPhotoFromSystem() -> Array<UIImage> {
        
        var photoAsset: PHAsset = PHAsset()
        var photoAssetCollection: PHAssetCollection = PHAssetCollection()
        var result: PHFetchResult!
        
        result = PHAssetCollection.fetchAssetCollectionsWithType(PHAssetCollectionType.Album, subtype: PHAssetCollectionSubtype.AlbumRegular, options: nil)
        
        println(result)
        
        
        return []
    }
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImages.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell: SPCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as SPCollectionViewCell
        
        cell.imagePhotoView.image = allImages[indexPath.row]
        
        
        println(allImages[0])
        println(cell.imagePhotoView.image)
        
        return cell
    }

    
    
    
    
    // MARK: UICollectionViewDelegate




}































