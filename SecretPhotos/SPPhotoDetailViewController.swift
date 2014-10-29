//
//  SPPhotoDetailViewController.swift
//  SecretPhotos
//
//  Created by Mark on 14-9-30.
//  Copyright (c) 2014 Mark. All rights reserved.
//

import UIKit

class SPPhotoDetailViewController: UIViewController {

    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    
    var testText: String!
    var photoImage: UIImage!
    
    //var photoImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.testLabel.text = testText
        self.photoImageView.image = photoImage
        //photoImageView.image = UIImage(named: "2.jpg", inBundle: nil, compatibleWithTraitCollection: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
