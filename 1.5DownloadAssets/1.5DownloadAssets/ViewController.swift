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

//1.6 Exporting Device-specific binaries
// You want to extract your app's binary for a specific device architecture to find out how big your binary will be on that device when the user downloads your app.
// 1. Archive your app in Xcode.
// 2. In the Archives screen, click the Export button.
// 3. Choose the " Save for Ad Hoc Deployment" option in the new screen and click Next.
// 4. In the new window, choose "Export for specific device" and then choose your device from the list.
// 5. Once you are done, click the Next button and save your file to disk.

//1.7 Linking Seperate Storyboards Together
// You have a messy storyboard, so you would like to place some view controllers in their own storyboard and still be able to cross-reference them in your other storyboards.
// US IB's new "Refactor to Storyboard" feature under the Editor menu.






























