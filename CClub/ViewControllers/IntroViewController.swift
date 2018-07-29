//
//  IntroViewController.swift
//  CClub
//
//  Created by MehrYasan on 6/20/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import Spring
import Lottie

class IntroViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{

    @IBOutlet var lottieLoading: UIView!
    
    @IBOutlet var loadingView: UIView!
    
    @IBOutlet var logo: SpringImageView!
    
    private static let kRotationAnimationKey = "rotationanimationkey"
    
    var animationView :  LOTAnimationView?
    
    var gameTimer: Timer!
    var isPassedLoading = false
    var isSignIn = false
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameTimer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        runLoading()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.rotate()
        signIn()
    }
    
    
    func nextView(){
        if(App.defaults.object(forKey: DefaultStrings.loginRes) != nil && isPassedLoading){
            
            let appDelegate = UIApplication.shared.delegate! as! AppDelegate
            let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "MainTabBarController")
            appDelegate.window?.rootViewController = initialViewController
            appDelegate.window?.makeKeyAndVisible()
            
        }else if(isPassedLoading && isSignIn){
            
            UIView.animate(withDuration: 0.6,delay: 0.0,options: .curveEaseInOut ,animations: {
                self.loadingView.frame.origin.y = self.view.frame.height + 10
            },completion : nil)
            
        }
    }
    
    
    
    
    
    
    func signIn(){
        isSignIn = true
        nextView()
    }
    
    
    func rotate(duration: Double = 2) {
        isPassedLoading = false
        if self.logo.layer.animation(forKey: "rotationanimationkey") == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = 1
            self.logo.layer.add(rotationAnimation, forKey: "rotationanimationkey")
        }
    }
    
    func stopRotating() {
        if self.logo.layer.animation(forKey: "rotationanimationkey") != nil {
            self.logo.layer.removeAnimation(forKey: "rotationanimationkey")
        }
    }

    @objc func runTimedCode(){
        gameTimer.invalidate()
        isPassedLoading = true
        nextView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func runLoading(){
        
        self.animationView = LOTAnimationView(name: "loading1")
        
        self.animationView?.frame.size = self.lottieLoading.frame.size
        
        self.animationView?.frame.origin = .init(x: 0, y: 0)
        
        self.animationView?.contentMode = UIViewContentMode.scaleAspectFit
        
        self.animationView?.alpha = 1
        
        self.lottieLoading.addSubview(self.animationView!)
        
        self.animationView?.loopAnimation = true
        
        self.animationView?.play()
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath as IndexPath)
        
        if(indexPath.item == 0){
            (cell.viewWithTag(10) as! UIImageView).image = UIImage.init(named: "0001")
            return cell
        }else if(indexPath.item == 1){
            (cell.viewWithTag(10) as! UIImageView).image = UIImage.init(named: "0002")
            return cell
        }else if(indexPath.item == 2){
            (cell.viewWithTag(10) as! UIImageView).image = UIImage.init(named: "0003")
            return cell
        }else if(indexPath.item == 3){
            (cell.viewWithTag(10) as! UIImageView).image = UIImage.init(named: "")
            return cell
        }else{
            (cell.viewWithTag(10) as! UIImageView).image = UIImage.init(named: "")
            UIView.animate(withDuration: 0.2,delay: 0.0,options: .curveEaseInOut ,animations: {
                self.collectionView.alpha = 0
            }){completion in
                let vC : RegisterViewController = (self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController"))! as! RegisterViewController
                self.navigationController?.pushViewController(vC, animated: true)
            }
           
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
    
    
 
    
}





















