//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Masayoshi Kanai on 2017/07/03.
//  Copyright © 2017年 Masayoshi Kanai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!

    var timer: Timer!
    var timer_sec: Float = 0
    var onOffSwitch = false
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func tapImage(_ sender: UITapGestureRecognizer) {
    }
    
    var displayImageNumber = 0
    
    let image0 = UIImage(named: "pandita.jpg")!
    let image1 = UIImage(named: "conejita.jpg")!
    let image2 = UIImage(named: "koalita.jpg")!
    
    var imageListArray: Array<UIImage> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageListArray.append(image0)
        imageListArray.append(image1)
        imageListArray.append(image2)
        imageView.image = image0
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender:  Any?) {
        let enlargeViewController = segue.destination as! enlargeViewController
        enlargeViewController.image = imageView.image
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        if displayImageNumber == 2 {
            displayImageNumber = 0
        } else {
            displayImageNumber += 1
        }
        displayImage()
    }
    
    @IBAction func returnButton(_ sender: Any) {
        
        if displayImageNumber == 0 {
            displayImageNumber = 2
        } else {
            displayImageNumber -= 1
        }
        displayImage()
    }
    
    @IBAction func playAndPauseButton(_ sender: Any) {
        
        if onOffSwitch == false {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(autoImageView), userInfo: nil, repeats: true)
            onOffSwitch = true
            playPauseButton.setTitle("停止", for: .normal)
            nextButton.isEnabled = false
            returnButton.isEnabled = false
        } else {
            self.timer.invalidate()
            self.timer_sec = 0
            onOffSwitch = false
            playPauseButton.setTitle("再生", for: .normal)
            nextButton.isEnabled = true
            returnButton.isEnabled = true
        }

    }
    
    func displayImage() {
        let image = imageListArray[displayImageNumber]
        imageView.image = image
    }
    
    func autoImageView(Timer: Timer) {
        self.timer_sec += 2
        
        if displayImageNumber == 2 {
            displayImageNumber = 0
        } else {
            displayImageNumber += 1
        }
        displayImage()
    }
}

