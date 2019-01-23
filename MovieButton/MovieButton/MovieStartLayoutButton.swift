//
//  MovieStartLayoutButton.swift
//  MovieButton
//
//  Created by 鶴本賢太朗 on 2019/01/23.
//  Copyright © 2019 Kentarou. All rights reserved.
//

import UIKit

class MovieStartLayoutButton: UIButton {
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    private var shapeLayer: CAShapeLayer {
        return self.layer as! CAShapeLayer
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        // 白い円
        let circleWidth: CGFloat = self.bounds.width
        let circleHeight: CGFloat = circleWidth
        let circlePath: UIBezierPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: circleWidth, height: circleHeight))
        // 中の透明の三角形
        // 中を三角形の形でくり抜く
        let triangleLine = UIBezierPath()
        do {
            // 円に内接する正方形の一辺の長さを求める
            let taikaku: CGFloat = circleWidth
            let seihouLength: CGFloat = taikaku / sqrt(2.0)
            let offsetX: CGFloat = (circleWidth - seihouLength) / 2
            let offsetY: CGFloat = (circleHeight - seihouLength) / 2
            // 中央の三角形のパスを作成する
            // 中心値から左斜め上に少しずらした位置がスタート地点
            let leftTopPointX: CGFloat = seihouLength * (1/2.7)
            let leftTopPointY: CGFloat = seihouLength * (1/3.9)
            let rightCenterPointX: CGFloat = seihouLength * (3/4)
            let rightCenterPointY: CGFloat = seihouLength * (1/1.9)
            let leftBottomPointX: CGFloat = leftTopPointX
            let leftBottomPointY: CGFloat = leftTopPointY * 3
            triangleLine.move(to: CGPoint(x: leftTopPointX + offsetX, y: leftTopPointY + offsetY))
            triangleLine.addLine(to: CGPoint(x: rightCenterPointX + offsetX, y: rightCenterPointY + offsetY))
            triangleLine.addLine(to: CGPoint(x: leftBottomPointX + offsetX, y: leftBottomPointY + offsetY))
            triangleLine.close()
        }
        circlePath.append(triangleLine)
        self.shapeLayer.path = circlePath.cgPath
    }
}

extension MovieStartLayoutButton {
    private func initialize() {
        self.shapeLayer.fillRule = kCAFillRuleEvenOdd
        self.shapeLayer.fillColor = UIColor.rgb(255, g: 255, b: 255, alpha: 0.5).cgColor
    }
}
