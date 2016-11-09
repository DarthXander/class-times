//
//  TimeLeftView.swift
//  Class Times
//
//  Created by Xander Clair on 11/9/16.
//  Copyright © 2016 Xander Clair. All rights reserved.
//

import UIKit

protocol TimeLeftDataSource: class {
    func getFilledAngle() -> CGFloat
}

class TimeLeftView: UIView {
    var dataSource: TimeLeftDataSource? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private var color: UIColor = UIColor.red {
        didSet {
            color.set()
            setNeedsDisplay()
        }
    }
    
    private var countdownCenter: CGPoint {
        return CGPoint(x: bounds.width/2.0, y: bounds.height/2.0)
    }
    private var radius: CGFloat {
        return min(bounds.width/2.0, bounds.height/2.0)*CGFloat(0.9)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        if let source = dataSource {
            let path = UIBezierPath(arcCenter: countdownCenter, radius: radius, startAngle: 0.0, endAngle: source.getFilledAngle(), clockwise: true)
            path.fill()
        }
    }
 

}
