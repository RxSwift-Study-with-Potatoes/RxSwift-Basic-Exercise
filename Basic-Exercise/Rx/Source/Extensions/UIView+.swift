//
//  UIView+.swift
//  Rx
//
//  Created by taehy.k on 2021/08/31.
//

/*
    makeRounded 사용법)
    cornerView.makeRounded(cornerRadius: 50, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
 
    모서리) X: 좌우, Y: 상하 로 생각하면 어렵지 않음
    - layerMinXMinYCorner : 왼쪽 상단
    - layerMaxXMinYCorner : 오른쪽 상단
    - layerMinXMaxYCorner : 왼쪽 하단
    - layerMaxXMaxYCorner : 오른쪽 하단
*/

import UIKit

extension UIView {
    // Set Rounded View
    func makeRounded(cornerRadius: CGFloat?, maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]) {
        
        if let cornerRadius_ = cornerRadius {
            layer.cornerRadius = cornerRadius_
        } else {
            layer.cornerRadius = layer.frame.height / 2
        }
        
        layer.masksToBounds = true
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}
