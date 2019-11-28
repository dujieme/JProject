//
//  ViewController.swift
//  SwiftTest
//
//  Created by don on 2019/5/20.
//  Copyright © 2019 don. All rights reserved.
//

import UIKit
import CoreBluetooth
import LTMorphingLabel

class ViewController: UIViewController ,LTMorphingLabelDelegate{
    
    
    @IBOutlet weak var contentLabel: LTMorphingLabel!
    
    let contentLabel1 = LTMorphingLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentLabel.textColor = UIColor.black
        contentLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        contentLabel.text = "xib今天 上海天气怎么样"
        
        contentLabel1.textColor = UIColor.black
        contentLabel1.frame.origin = CGPoint.init(x: 30, y: 200)
        contentLabel1.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        contentLabel1.text = "code 今天 上海天气怎么样"
        contentLabel1.sizeToFit()
        view.addSubview(contentLabel1)
    }
    var isBold = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isBold {
            contentLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
            contentLabel1.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        }else{
            contentLabel.font = UIFont.systemFont(ofSize: 30, weight: .regular)
            contentLabel1.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        }
        isBold = !isBold
    }    
}

