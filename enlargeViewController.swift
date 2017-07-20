//
//  enlargeViewController.swift
//  SlideshowApp
//
//  Created by Masayoshi Kanai on 2017/07/03.
//  Copyright © 2017年 Masayoshi Kanai. All rights reserved.
//

import UIKit

class enlargeViewController: UIViewController {
    
    var image: UIImage!
    
    @IBOutlet weak var largeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        largeImage.image = image
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
