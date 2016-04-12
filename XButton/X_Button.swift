//
//  XSwiftButton.swift
//  ButtonAlignment
//
//  Created by sam on 2/3/16.
//  Copyright © 2016年 xie. All rights reserved.
//

import UIKit

//private var status: XAlignmentStatus?
class X_Button: UIButton {
    var status: XAlignmentStatus!
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func drawRect(rect: CGRect) {
//        // Drawing code
//    }

    // Mark: - 左对齐
    func alignmentLeft() {
        
        var titleFrame = self.titleLabel?.frame
        
        titleFrame?.origin.x = 0
        
        var imageFrame = self.imageView?.frame
        
        imageFrame?.origin.x = CGRectGetWidth(titleFrame!)
        
        self.titleLabel?.frame = titleFrame!
        self.imageView?.frame = imageFrame!
        
    }
    // MARK: - 右对齐
    func alignmentRight() {
        
        let titleStr: NSString = NSString(string: (self.titleLabel?.text)!)
        let frame = titleStr.boundingRectWithSize(CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName : (self.titleLabel?.font)!], context: nil)
        var imageFrame = self.imageView?.frame
        imageFrame?.origin.x = self.bounds.size.width - (self.imageView?.bounds.size.width)!
        var titleFrame = self.titleLabel?.frame
        titleFrame?.origin.x = (imageFrame?.origin.x)! - frame.size.width
        
        self.titleLabel?.frame = titleFrame!
        self.imageView?.frame = imageFrame!
    }
    // MARK: - 居中对齐
    func aligmentCenter() {
        // 设置文本坐标
          let labelX = (self.bounds.width - (self.titleLabel?.bounds.width)! - (self.imageView?.bounds.width)! - 7) * 0.5
        let labelY = (self.bounds.height - (self.titleLabel?.bounds.height)!) * 0.5
        self.titleLabel?.frame = CGRectMake(labelX, labelY, (self.titleLabel?.bounds.width)!, (self.titleLabel?.bounds.height)!)
        //设置label的frame
        let imageX = CGRectGetMaxX((self.titleLabel?.frame)!) + 7
        let imageY = (self.bounds.height - (self.imageView?.frame.height)!) * 0.5
        // 设置图片的frame
        self.imageView?.frame = CGRectMake(imageX, imageY, (self.imageView?.bounds.width)!, (self.imageView?.bounds.height)!)
    }
    // MARK: - 图标在上，文本在下（居中）
    func alignmentTop() {
        
        self.titleLabel?.textAlignment = NSTextAlignment.Center
        //计算文本的宽度
        let titleStr: NSString = NSString(string: (self.titleLabel?.text)!)
        
        let frame = titleStr.boundingRectWithSize(CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName : (self.titleLabel?.font)!], context: nil)
        
        let imageX = (self.bounds.width - (self.imageView?.bounds.width)!) * 0.5
        
        self.titleLabel?.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, self.bounds.height * 0.5 + (self.titleLabel?.bounds.height)! * 0.8 + 4, (self.titleLabel?.bounds.width)!, (self.titleLabel?.bounds.height)!)
        
        self.imageView?.frame = CGRectMake(imageX, self.bounds.height * 0.5 - (self.imageView?.bounds.height)! * 0.8, (self.imageView?.bounds.width)!, (self.imageView?.bounds.height)!)
        
        var labelCenter = self.titleLabel?.center
        labelCenter?.x = (self.imageView?.center.x)!
        self.titleLabel?.center = labelCenter!
        
    }
    //MARK: - 图标在下，文本在上（居中）
    func alignmentButtom() {
        //计算文本的宽度
        self.titleLabel?.textAlignment = NSTextAlignment.Center
        let titleStr: NSString = NSString(string: (self.titleLabel?.text)!)
        
        let frame = titleStr.boundingRectWithSize(CGSizeMake(CGFloat(MAXFLOAT), CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName : (self.titleLabel?.font)!], context: nil)
        
        let imageX = (self.bounds.width - (self.imageView?.bounds.width)!) * 0.5
        
        self.titleLabel?.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, self.bounds.height * 0.5 - (self.titleLabel?.bounds.height)! * (1 + 0.5), (self.titleLabel?.bounds.width)!, (self.titleLabel?.bounds.height)!)
        
        self.imageView?.frame = CGRectMake(imageX, self.bounds.height * 0.5, (self.imageView?.bounds.width)!, (self.imageView?.bounds.height)!)
        
        var labelCenter = self.titleLabel?.center
        labelCenter?.x = (self.imageView?.center.x)!
        self.titleLabel?.center = labelCenter!
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        // 判断
        if (status == XAlignmentStatus.XAlignmentStatusNormal) {
            
        }
        else if (status == XAlignmentStatus.XAlignmentStatusLeft){
            self.alignmentLeft()
        }
        else if (status == XAlignmentStatus.XAlignmentStatusCenter){
            self.aligmentCenter()
        }
        else if (status == XAlignmentStatus.XAlignmentStatusRight){
            self.alignmentRight()
        }
        else if (status == XAlignmentStatus.XAlignmentStatusTop){
            self.alignmentTop()
        }
        else if (status == XAlignmentStatus.XAlignmentStatusBottom){
            self.alignmentButtom()
        }
    }
}

enum XAlignmentStatus {
    case XAlignmentStatusNormal // 正常
    // 图标和文本位置变化
    case XAlignmentStatusLeft // 左对齐
    case XAlignmentStatusCenter // 居中对齐
    case XAlignmentStatusRight // 右对齐
    case XAlignmentStatusTop // 图标在上，文本在下(居中)
    case XAlignmentStatusBottom // 图标在下，文本在上(居中)
}