//
//  CALayer+.swift
//  Rx
//
//  Created by taehy.k on 2021/08/31.
//

import UIKit

extension CALayer {
    func applyShadow(color: UIColor,
                     alpha: Float,
                     x: CGFloat,
                     y: CGFloat,
                     blur: CGFloat) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 1.0
    }
    
    /*
     다음과 같이 사용: view.layer.addBorder([.top, .bottom], color: UIColor.white, width: 1.0)
     Default: .all, .black, 1.0
     */
    func addBorder(_ edges: [UIRectEdge] = [UIRectEdge.all], color: UIColor = .black, width: CGFloat = 1.0) {
        for edge in edges {
            let border = CALayer()
            
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            
            border.backgroundColor = color.cgColor
            self.addSublayer(border)
        }
    }
}
