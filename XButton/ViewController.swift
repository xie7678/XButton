//
//  ViewController.swift
//  XButton
//
//  Created by sam on 12/4/16.
//  Copyright © 2016年 xie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wechatQButton: X_Button!
    @IBOutlet weak var QQButton: X_Button!
    @IBOutlet weak var QZoneButton: X_Button!
    @IBOutlet weak var wechatButton: X_Button!
    override func viewDidLoad() {
        super.viewDidLoad()
        /** 设置按钮样式 FLAlignmentStatusTop 图标在上文本在下（居中）*/
        self.wechatButton.status = XAlignmentStatus.XAlignmentStatusBottom
        self.wechatQButton.status = XAlignmentStatus.XAlignmentStatusLeft
        self.QQButton.status = XAlignmentStatus.XAlignmentStatusRight
        self.QZoneButton.status = XAlignmentStatus.XAlignmentStatusTop
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

