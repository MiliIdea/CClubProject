//
//  mainTabbarController.swift
//  CClub
//
//  Created by MehrYasan on 6/20/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import Foundation
import UIColor_Hex_Swift

class MainTabBarController: UITabBarController {

    
    @IBOutlet var myTabBar: UITabBar!
    
    let arrayOfImageNameForSelectedState : [String] = ["icons5","icons4","icons3","icons2","icons1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 4
        
        if let count = self.tabBar.items?.count {
            for i in 0...(count-1) {
                let imageNameForSelectedState   = arrayOfImageNameForSelectedState[i]
//                let imageNameForUnselectedState = arrayOfImageNameForSelectedState[i]
                
                myTabBar.items?[i].selectedImage = self.resizeImage(image: UIImage(named: imageNameForSelectedState)!.withRenderingMode(.alwaysOriginal), targetSize: .init(width: 40, height: 40)).withRenderingMode(.alwaysOriginal)

                myTabBar.items?[i].image = self.resizeImage(image: UIImage(named: imageNameForSelectedState)!.withRenderingMode(.alwaysOriginal), targetSize: .init(width: 40, height: 40)).withRenderingMode(.alwaysOriginal)
            }
        }
        
        let selectedColor   = UIColor("#FF2600")
        let unselectedColor = UIColor.red
        
        UITabBarItem.appearance().setTitleTextAttributes([kCTForegroundColorAttributeName as NSAttributedStringKey: unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([kCTForegroundColorAttributeName as NSAttributedStringKey: selectedColor], for: .selected)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width : size.width * heightRatio,height :  size.height * heightRatio)
        } else {
            newSize = CGSize(width : size.width * widthRatio,height :  size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x : 0,y : 0,width :  newSize.width, height : newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
