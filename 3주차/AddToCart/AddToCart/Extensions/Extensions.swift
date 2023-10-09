//
//  Extensions.swift
//  TheDeliveryPeopleCart
//
//  Created by 조유진 on 2023/09/17.
//

import UIKit

extension UIView {
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    
    public var bottom: CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    public var left: CGFloat {
        return frame.origin.x
    }
    
    public var right: CGFloat {
        return frame.origin.x + frame.size.width
    }
}

extension UILabel {
    func dynamicFont(fontSize size: CGFloat) {
        let currentFontName = self.font.fontName
        var calculetedFont: UIFont?
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        switch height {
        case 480.0: // Iphone 3, 4S => 3.5 inch
            calculetedFont = UIFont(name: currentFontName, size: size * 0.08)
            resizeFont(calculatedFont: calculetedFont)
            break
        
        case 568.0: // Iphone 5, SE => 4 inch
            calculetedFont = UIFont(name: currentFontName, size: size * 0.06)
            resizeFont(calculatedFont: calculetedFont)
            break
            
        case 667.0: // Iphone 6, 6S, 7, 8 => 4.7 inch
            calculetedFont = UIFont(name: currentFontName, size: size * 0.92)
            resizeFont(calculatedFont: calculetedFont)
            break
            
        case 736.0: // Iphone 6s+, 6+, 7+, 8+ => 5.5 inch
            calculetedFont = UIFont(name: currentFontName, size: size * 0.95)
            resizeFont(calculatedFont: calculetedFont)
            break
            
        case 812.0: // Iphone X, XS => 5.8 inch
            calculetedFont = UIFont(name: currentFontName, size: size)
            resizeFont(calculatedFont: calculetedFont)
            break
            
        case 896.0: // Iphone XR => 6.1 inch
            calculetedFont = UIFont(name: currentFontName, size: size)
            resizeFont(calculatedFont: calculetedFont)
            break
            
        default:
            print("not an iPhone")
            break
        }

    }
    
    private func resizeFont(calculatedFont: UIFont?) {
        self.font = calculatedFont
    }
}


extension UIImage {
    func resized(to newSize: CGSize) -> UIImage?{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
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
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}


