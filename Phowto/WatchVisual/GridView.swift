//
//  GridView.swift
//  Phowto
//
//  Created by heri hermawan on 09/04/22.
//

import Foundation
import UIKit

 class GridView: UIView {

 override func draw(_ rect: CGRect) {

     let firstColumnPath = UIBezierPath()
     firstColumnPath.move(to: CGPoint(x: bounds.width / 3, y: 0))
     firstColumnPath.addLine(to: CGPoint(x: bounds.width / 3, y: bounds.height))
     let firstColumnLayer = gridLayer()
     firstColumnLayer.path = firstColumnPath.cgPath
     layer.addSublayer(firstColumnLayer)

     let secondColumnPath = UIBezierPath()
     secondColumnPath.move(to: CGPoint(x: (2 * bounds.width) / 3, y: 0))
     secondColumnPath.addLine(to: CGPoint(x: (2 * bounds.width) / 3, y: bounds.height))
     let secondColumnLayer = gridLayer()
     secondColumnLayer.path = secondColumnPath.cgPath
     layer.addSublayer(secondColumnLayer)

     let firstRowPath = UIBezierPath()
     firstRowPath.move(to: CGPoint(x: 0, y: bounds.height / 3))
     firstRowPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height / 3))
     let firstRowLayer = gridLayer()
     firstRowLayer.path = firstRowPath.cgPath
     layer.addSublayer(firstRowLayer)

     let secondRowPath = UIBezierPath()
     secondRowPath.move(to: CGPoint(x: 0, y: ( 2 * bounds.height) / 3))
     secondRowPath.addLine(to: CGPoint(x: bounds.width, y: ( 2 * bounds.height) / 3))
     let secondRowLayer = gridLayer()
     secondRowLayer.path = secondRowPath.cgPath
     layer.addSublayer(secondRowLayer)
 }
 private func gridLayer() -> CAShapeLayer {
     let shapeLayer = CAShapeLayer()
     shapeLayer.strokeColor = UIColor(white: 1.0, alpha: 0.3).cgColor
     shapeLayer.frame = bounds
     shapeLayer.fillColor = nil
     return shapeLayer
 }
}
