//
//  WeChatDrawView.swift
//  WeChat
//
//  Created by Smile on 16/1/13.
//  Copyright © 2016年 smile.love.tao@gmail.com. All rights reserved.
//

import UIKit

//自定义绘图
class WeChatDrawView: UIView {
    
    func setUp() -> CAShapeLayer{
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 0.5// 线条宽度
        shapeLayer.fillColor = UIColor.clearColor().CGColor// 闭环填充的颜色
        shapeLayer.lineJoin = kCALineCapSquare
        shapeLayer.strokeColor = UIColor.clearColor().CGColor// 边缘线的颜色
        shapeLayer.strokeEnd = 1.0
        self.layer.masksToBounds = false
        return shapeLayer
    }
    
    //绘制标题
    func drawAlertLabel(content:String,y:CGFloat,size:CGFloat,color:UIColor,isBold:Bool,fontName:String,width:CGFloat,height:CGFloat) -> UILabel{
        let titleLabel = UILabel()
        titleLabel.text = content
        titleLabel.textAlignment = .Center
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        titleLabel.font = UIFont(name: fontName, size: size)
        titleLabel.textColor = color
        
        //返回文本绘制所占据的矩形空间
        /*let options:NSStringDrawingOptions = .UsesLineFragmentOrigin
        let boundingRect = content.boundingRectWithSize(CGSizeMake(oneBlockWidth, labelHeight), options: options, attributes: [NSFontAttributeName:titleLabel.font], context: nil)
        if y == 0 {
        titleLabel.frame = CGRectMake(paddintLeft, paddintTop, oneBlockWidth, boundingRect.size.height)
        } else {
        titleLabel.frame = CGRectMake(paddintLeft, y + paddintTop, oneBlockWidth, boundingRect.size.height)
        }*/
        
        
        titleLabel.frame = CGRectMake(0, y, width, height)
        titleLabel.backgroundColor = UIColor.whiteColor()
        
        //drawRect(beginPointX: titleLabel.frame.origin.x, beginPointY: titleLabel.frame.origin.y, width: titleLabel.frame.width, height: titleLabel.frame.height)
        return titleLabel
    }
    
    //绘制直线
    func drawLine(beginPointX x1:CGFloat,beginPointY y1:CGFloat,endPointX x2:CGFloat,endPointY y2:CGFloat) -> CAShapeLayer{
        // 创建path
        let path = UIBezierPath()
        // 添加路径[1条点(x1,y1)到点(x2,y2)的线段]到path
        path.moveToPoint(CGPointMake(x1, y1))
        path.addLineToPoint(CGPointMake(x2,y2))
        // 将path绘制出来
        //path.stroke()
        
        let shape = CAShapeLayer()
        shape.path = path.CGPath
        shape.strokeColor = UIColor.darkGrayColor().CGColor
        shape.lineWidth = 0.5
        path.closePath()
        return shape
    }
    
    //绘制直线
    func drawLine(beginPointX x1:CGFloat,beginPointY y1:CGFloat,endPointX x2:CGFloat,endPointY y2:CGFloat,color:UIColor) -> CAShapeLayer{
        // 创建path
        let path = UIBezierPath()
        // 添加路径[1条点(x1,y1)到点(x2,y2)的线段]到path
        path.moveToPoint(CGPointMake(x1, y1))
        path.addLineToPoint(CGPointMake(x2,y2))
        // 将path绘制出来
        //path.stroke()
        
        let shape = CAShapeLayer()
        shape.path = path.CGPath
        shape.strokeColor = color.CGColor
        shape.lineWidth = 0.5
        path.closePath()
        return shape
    }
    
    //绘制圆,startAngle 是以 x 轴正方向为起点，clockwise 则是用来标记是否为顺时针方向。
    func drawArc(point:CGPoint,radius:CGFloat,color:UIColor) -> CAShapeLayer{
        let path = UIBezierPath()
        //endAngle为180也okay,radius:表示圆大小
        path.addArcWithCenter(point, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        
        let shape = CAShapeLayer()
        shape.path = path.CGPath
        shape.fillColor = color.CGColor
        shape.lineWidth = 1
        path.closePath()
        return shape
    }
    
    //绘制圆,startAngle 是以 x 轴正方向为起点，clockwise 则是用来标记是否为顺时针方向。
    func drawArc(point:CGPoint,radius:CGFloat,strokeColor:UIColor,fillColor:UIColor,
            shadowOpacity:CGFloat,shadowOffset:CGSize,shadowRadius:CGFloat,shadowColor:UIColor) -> CAShapeLayer{
        let path = UIBezierPath()
        path.addArcWithCenter(point, radius: radius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
        
        let shape = CAShapeLayer()
        shape.path = path.CGPath
        shape.fillColor = fillColor.CGColor// 闭环填充的颜色
        shape.strokeColor = strokeColor.CGColor// 边缘线的颜色
        shape.strokeEnd = 1.0
        shape.lineWidth = 1
        shape.shadowOpacity = Float(shadowOpacity)
        shape.shadowOffset = shadowOffset
        shape.shadowRadius = shadowRadius
        shape.shadowColor = shadowColor.CGColor
        path.closePath()
        return shape
    }
    
    func drawArc(path:UIBezierPath,point:CGPoint,radius:CGFloat,strokeColor:UIColor,fillColor:UIColor,
        shadowOpacity:CGFloat,shadowOffset:CGSize,shadowRadius:CGFloat,shadowColor:UIColor) -> CAShapeLayer{
            let shape = CAShapeLayer()
            shape.path = path.CGPath
            shape.fillColor = fillColor.CGColor// 闭环填充的颜色
            shape.strokeColor = strokeColor.CGColor// 边缘线的颜色
            shape.strokeEnd = 1.0
            shape.lineWidth = 1
            shape.shadowOpacity = Float(shadowOpacity)
            shape.shadowOffset = shadowOffset
            shape.shadowRadius = shadowRadius
            shape.shadowColor = shadowColor.CGColor
            path.closePath()
            return shape
    }
    
    func drawArc(point:CGPoint,radius:CGFloat,fillColor:UIColor,strokeColor:UIColor,
        shadowOpacity:CGFloat,shadowOffset:CGSize,shadowRadius:CGFloat,shadowColor:UIColor){
            let path = UIBezierPath()
            path.addArcWithCenter(point, radius: radius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
            
            let shape = CAShapeLayer()
            shape.path = path.CGPath
            shape.fillColor = fillColor.CGColor// 闭环填充的颜色
            shape.strokeColor = strokeColor.CGColor// 边缘线的颜色
            shape.strokeEnd = 1.0
            shape.lineWidth = 1
            shape.shadowOpacity = Float(shadowOpacity)//阴影不透明度
            shape.shadowOffset = shadowOffset//阴影偏移量
            shape.shadowRadius = shadowRadius//阴影半径
            shape.shadowColor = shadowColor.CGColor
            path.closePath()
            self.layer.addSublayer(shape)
    }
    
    //绘制矩形
    func drawRect(beginPointX x:CGFloat,beginPointY y:CGFloat,width:CGFloat,height:CGFloat) -> CAShapeLayer{
        let path = UIBezierPath(roundedRect: CGRectMake(x, y, width, height), cornerRadius: 0)
        path.fill()
        let shape = CAShapeLayer()
        shape.path = path.CGPath
        shape.fillColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1).CGColor
        shape.lineWidth = 0.1
        path.closePath()
        return shape
    }
    
    func drawRect(beginPointX x:CGFloat,beginPointY y:CGFloat,width:CGFloat,height:CGFloat,color:UIColor) -> CAShapeLayer{
        let path = UIBezierPath(roundedRect: CGRectMake(x, y, width, height), cornerRadius: 0)
        path.fill()
        let shape = CAShapeLayer()
        shape.path = path.CGPath
        shape.fillColor = color.CGColor
        shape.lineWidth = 0.1
        path.closePath()
        return shape
    }
    
    
    //MARKS: 画底部线条
    func drawLineAtLast(beginX:CGFloat,height:CGFloat) -> CAShapeLayer{
        return drawLine(beginPointX: beginX, beginPointY: height, endPointX: UIScreen.mainScreen().bounds.width, endPointY: height,color:UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1))
    }

    //画聊天对话框,剪头向下
    func drawDialog(){
        let path = UIBezierPath()
        path.addArcWithCenter(CGPoint(x: 300-10, y: 50), radius: 10 , startAngle: 0 , endAngle: CGFloat(M_PI/2)  , clockwise: true) //1st rounded corner
        path.addArcWithCenter(CGPoint(x: 200, y: 50), radius:10, startAngle: CGFloat(2 * M_PI / 3), endAngle:CGFloat(M_PI) , clockwise: true)// 2rd rounded corner
        path.addArcWithCenter(CGPoint(x: 200, y: 10), radius:10, startAngle: CGFloat(M_PI), endAngle:CGFloat(3 * M_PI / 2), clockwise: true)// 3rd rounded corner
        // little triangle
        path.addLineToPoint(CGPoint(x:240 , y:0))
        path.addLineToPoint(CGPoint(x: 245, y: -10))
        path.addLineToPoint(CGPoint(x:250, y: 0))
        path.addArcWithCenter(CGPoint(x: 290, y: 10), radius: 10, startAngle: CGFloat(3 * M_PI / 2), endAngle: CGFloat(2 * M_PI ), clockwise: true)
        path.addLineToPoint(CGPoint(x:300 , y:50))
        path.closePath()
    }
    
    
}
