//
//  ColorTools.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/9.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class ColorTools: NSObject {

    class func changeColor(startColor:UIColor, endColor:UIColor, frame:CGRect) -> CAGradientLayer{
        //定义渐变的颜色（从黄色渐变到橙色）
        let topColor = startColor
        let buttomColor = endColor
        let gradientColors = [topColor.cgColor, buttomColor.cgColor]
        
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        
        //创建CAGradientLayer对象并设置参数
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        //设置其CAGradientLayer对象的frame，并插入view的layer
        gradientLayer.frame = frame
        return gradientLayer
    }
}

