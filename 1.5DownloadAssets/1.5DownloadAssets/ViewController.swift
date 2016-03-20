//
//  ViewController.swift
//  1.5DownloadAssets
//
//  Created by Xiulan Shi on 3/19/16.
//  Copyright © 2016 Xiulan Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var img1: UIImageView!

    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var img3: UIImageView!
    
    var imageViews: [UIImageView]{
        return [self.img1, self.img2, self.img3]
    }
    
    var currentResourcePack: NSBundleResourceRequest?
    
    func displayImagesForResourceTag(tag: String) {
        NSOperationQueue.mainQueue().addOperationWithBlock{
            for n in 0..<self.imageViews.count{
                self.imageViews[n].image = UIImage(named: tag + "-\(n+1)")
            }
        }
    }
    
    func useLevel(lvl: UInt32){
        
        let imageViews = [img1, img2, img3]
        
        for img in imageViews{
            img.image = nil
        }
        
        let tag = "level\(lvl)"
        
        if let req = currentResourcePack{
            req.endAccessingResources()
        }
        
        currentResourcePack = NSBundleResourceRequest(tags: [tag])
        
        guard let req = currentResourcePack else {
            return
        }
        
        req.conditionallyBeginAccessingResourcesWithCompletionHandler{available in
            if available{
                self.displayImagesForResourceTag(tag)
            } else {
                req.beginAccessingResourcesWithCompletionHandler{error in
                    guard error == nil else{
                        //TODO: you can handle the error here
                        return
                    }
                    self.displayImagesForResourceTag(tag)
            }
            }
        }
    }
    
    
    @IBAction func useLevel1(sender: AnyObject) {
        useLevel(1)
    }
    
    @IBAction func useLevel2(sender: AnyObject) {
        useLevel(2)
    }
    
    @IBAction func useLevel3(sender: AnyObject) {
        useLevel(3)
    }
    
   
}

