//
//  ViewController.swift
//  animation
//
//  Created by 迫 佑樹 on 2015/12/30.
//  Copyright © 2015年 迫 佑樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 1
    
    var timer = NSTimer()
    
    var playing = true
    
    @IBOutlet var alianImage: UIImageView!
    

    @IBOutlet var state: UIButton!
    
    @IBAction func updateImage(sender: AnyObject) {
        
        if playing{
            
            timer.invalidate()
            
            playing = false
            
            
            
        } else {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.60, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            playing = true

            
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        
    }
    
    func doAnimation(){
        count++
        
        if count > 5 {
            count = 1
            UIView.animateWithDuration(0.6) { () -> Void in
                self.alianImage.center = CGPointMake(self.alianImage.center.x + 400, self.alianImage.center.y)
            }
            
            
            UIView.animateWithDuration(1.3) { () -> Void in
                self.alianImage.center = CGPointMake(self.alianImage.center.x - 800, self.alianImage.center.y)
            }
            
            UIView.animateWithDuration(2) { () -> Void in
                self.alianImage.center = CGPointMake(self.alianImage.center.x + 400, self.alianImage.center.y)
            }
            
        }
        
        
        
        
        
        alianImage.image = UIImage(named: "\(count).tiff")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidLayoutSubviews() {
        //viewが表示される直前に呼ばれる．
        
        alianImage.center = CGPointMake(alianImage.center.x - 400, alianImage.center.y)
    }
    
    override func viewDidAppear(animated: Bool) {
        //ビューが画面に表示された時に呼ばれる．
        if count == 1 {
            UIView.animateWithDuration(1) { () -> Void in
                self.alianImage.center = CGPointMake(self.alianImage.center.x + 400, self.alianImage.center.y)
                
            }
        }
    }
}

