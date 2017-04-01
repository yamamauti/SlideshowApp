//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by Takayuki Yamauchi on 2017/04/01.
//  Copyright © 2017年 yamamauti. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    var enlargedImage = 0

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if enlargedImage == 1 {
            imageView.image = UIImage(named:"photo1.jpg")!
        }
        if enlargedImage == 2 {
            imageView.image = UIImage(named:"photo2.jpg")!
        }
        if enlargedImage == 3 {
            imageView.image = UIImage(named:"photo3.jpg")!
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
