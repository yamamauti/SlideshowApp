//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Takayuki Yamauchi on 2017/03/31.
//  Copyright © 2017年 yamamauti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var slide = 1
    var slidestate = 0
    var timer: Timer!
    var timer_sec: Float = 0
    
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var play: UIButton!
    @IBAction func unwind(segue: UIStoryboardSegue){if slidestate == 1{
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        play.setTitle("再生", for: UIControlState.normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let nextViewController:NextViewController = segue.destination as! NextViewController
        nextViewController.enlargedImage = slide
    }
    

    
    
    //画像表示
    func showImage(){
        if slide == 1 {
            imageView.image = UIImage(named:"photo1.jpg")!
        }
        if slide == 2 {
            imageView.image = UIImage(named:"photo2.jpg")!
        }
        if slide == 3 {
            imageView.image = UIImage(named:"photo3.jpg")!
        }
    }
    
    //タイマーカウント
    func updateTimer(timer: Timer){
        timer_sec += 1
        if timer_sec == 2{
            slide += 1
            if slide == 4{
                slide = 1
            }
            showImage()
            timer_sec = 0
        }
    }
    
    //進むボタン
    @IBAction func next(_ sender: Any) {
        if self.timer == nil{
            slide += 1
            if slide == 4{
                slide = 1
            }
            showImage()
        }
    }
 
    //戻るボタン
    @IBAction func previous(_ sender: Any) {
        if self.timer == nil{
            slide -= 1
            if slide == 0{
                slide = 3
            }
            showImage()
        }
    }
    
    //再生／停止ボタン
    @IBAction func play(_ sender: Any) {
        
            //初期状態で押した処理
            if slidestate == 0{
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                play.setTitle("停止", for: UIControlState.normal)
                nextButton.isEnabled = false
                previousButton.isEnabled = false
            }
            //再生状態で押した処理
            if slidestate == 1{
                self.timer.invalidate()
                self.timer = nil
                play.setTitle("再生", for: UIControlState.normal)
                nextButton.isEnabled = true
                previousButton.isEnabled = true
            }
            //一時停止状態で押した処理
            if slidestate == 2{
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                play.setTitle("停止", for: UIControlState.normal)
                nextButton.isEnabled = false
                previousButton.isEnabled = false
            }
        slidestate += 1
        if slidestate == 3{
            slidestate = 1
        }
            
        }
    
        
    //拡大ボタン
    
    @IBAction func enlarge(_ sender: Any) {
        if self.timer != nil{
        self.timer.invalidate()
        }
        
    }
    
        
    }

    


