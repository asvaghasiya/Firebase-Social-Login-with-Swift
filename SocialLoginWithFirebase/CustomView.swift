
import Foundation
import UIKit

@IBDesignable class CustomView: UIView
{
    var shadowAdded: Bool = false
    var previousCornerRadius: CGFloat = 0
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            previousCornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var isCircleEdges: Bool = false {
        didSet {
            if isCircleEdges {
                cornerRadius = self.frame.size.height/2
                layer.cornerRadius = cornerRadius
                layer.masksToBounds = cornerRadius > 0
            }
            else {
                layer.cornerRadius = previousCornerRadius
                layer.masksToBounds = previousCornerRadius > 0
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornersRounded: UIRectCorner = [] {
        didSet {
            
        }
    }
    
    @IBInspectable var firstCornerRound: Bool = false {
        didSet {
            setCornersRounded()
        }
    }
    
    @IBInspectable var secondCornerRound: Bool = false {
        didSet {
            setCornersRounded()
        }
    }
    
    @IBInspectable var thirdCornerRound: Bool = false {
        didSet {
            setCornersRounded()
        }
    }
    
    @IBInspectable var fourthCornerRound: Bool = false {
        didSet {
            setCornersRounded()
        }
    }
    
    @IBInspectable var roundedCorner: CGSize = CGSize(width: 10, height: 10) {
        didSet {
        }
    }
    
    
    func setCornersRounded() {
        if (firstCornerRound) {
            cornersRounded = [.topLeft]
            if secondCornerRound {
                cornersRounded = [.topLeft, .topRight]
                if thirdCornerRound {
                    cornersRounded = [.topLeft, .topRight, .bottomRight]
                    if fourthCornerRound {
                        cornersRounded = [.topLeft, .topRight, .bottomRight, .bottomLeft]
                    }
                }
            }
            else if thirdCornerRound {
                cornersRounded = [.topLeft, .bottomRight]
                if fourthCornerRound {
                    cornersRounded = [.topLeft, .bottomRight, .bottomLeft]
                }
            }
            else if fourthCornerRound {
                cornersRounded = [.topLeft, .bottomLeft]
            }
        }
        else if secondCornerRound {
            cornersRounded = [.topRight]
            if thirdCornerRound {
                cornersRounded = [.topRight, .bottomRight]
                if fourthCornerRound {
                    cornersRounded = [.topRight, .bottomRight, .bottomLeft]
                }
            }
            else if fourthCornerRound {
                cornersRounded = [.topRight, .bottomLeft]
            }
        }
        else if thirdCornerRound {
            cornersRounded = [.bottomRight]
            if fourthCornerRound {
                cornersRounded = [.bottomRight, .bottomLeft]
            }
        }
        else if fourthCornerRound {
            cornersRounded = [.bottomLeft]
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            
        }
    }
    
    @IBInspectable var shadowAlpha: Float = 1 {
        didSet {
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if shadowAdded { return }
        shadowAdded = true
        if isCircleEdges {
            cornerRadius = self.frame.size.height/2
        }
        let shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = UIColor.clear
        shadowLayer.layer.shadowColor = shadowColor.cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = shadowOffset //CGSize(width: 1.0, height: 5)
        shadowLayer.layer.shadowOpacity = shadowAlpha
        shadowLayer.layer.shadowRadius = shadowRadius
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        self.superview?.insertSubview(shadowLayer, belowSubview: self)
        
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: cornersRounded,
                                    cornerRadii: roundedCorner)
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.layer.mask = shape
    }
    
    override func layoutSubviews() {
        if shadowAdded { return }
        shadowAdded = true
        if isCircleEdges {
            cornerRadius = self.frame.size.height/2
        }
        let shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = UIColor.clear
        shadowLayer.layer.shadowColor = shadowColor.cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = shadowOffset //CGSize(width: 1.0, height: 5)
        shadowLayer.layer.shadowOpacity = shadowAlpha
        shadowLayer.layer.shadowRadius = shadowRadius
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        self.superview?.insertSubview(shadowLayer, belowSubview: self)
        
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: cornersRounded,
                                    cornerRadii: roundedCorner)
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.layer.mask = shape
    }
}


@IBDesignable class CustomImageView: UIImageView {
    var shadowAdded: Bool = false
    var previousCornerRadius: CGFloat = 0
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            previousCornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var isCircleEdges: Bool = false {
        didSet {
            if isCircleEdges {
                cornerRadius = self.frame.size.height/2
                layer.cornerRadius = cornerRadius
                layer.masksToBounds = cornerRadius > 0
            }
            else {
                layer.cornerRadius = previousCornerRadius
                layer.masksToBounds = previousCornerRadius > 0
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornersRounded: UIRectCorner = [] {
        didSet {
            
        }
    }
    
    @IBInspectable var firstCornerRound: Bool = false {
        didSet {
            setCornersRounded()
        }
    }
    
    @IBInspectable var secondCornerRound: Bool = false {
        didSet {
            setCornersRounded()
        }
    }
    
    @IBInspectable var thirdCornerRound: Bool = false {
        didSet {
            setCornersRounded()
        }
    }
    
    @IBInspectable var fourthCornerRound: Bool = false {
        didSet {
            setCornersRounded()
        }
    }
    
    @IBInspectable var roundedCorner: CGSize = CGSize(width: 10, height: 10) {
        didSet {
        }
    }
    
    
    func setCornersRounded() {
        if (firstCornerRound) {
            cornersRounded = [.topLeft]
            if secondCornerRound {
                cornersRounded = [.topLeft, .topRight]
                if thirdCornerRound {
                    cornersRounded = [.topLeft, .topRight, .bottomRight]
                    if fourthCornerRound {
                        cornersRounded = [.topLeft, .topRight, .bottomRight, .bottomLeft]
                    }
                }
            }
            else if thirdCornerRound {
                cornersRounded = [.topLeft, .bottomRight]
                if fourthCornerRound {
                    cornersRounded = [.topLeft, .bottomRight, .bottomLeft]
                }
            }
            else if fourthCornerRound {
                cornersRounded = [.topLeft, .bottomLeft]
            }
        }
        else if secondCornerRound {
            cornersRounded = [.topRight]
            if thirdCornerRound {
                cornersRounded = [.topRight, .bottomRight]
                if fourthCornerRound {
                    cornersRounded = [.topRight, .bottomRight, .bottomLeft]
                }
            }
            else if fourthCornerRound {
                cornersRounded = [.topRight, .bottomLeft]
            }
        }
        else if thirdCornerRound {
            cornersRounded = [.bottomRight]
            if fourthCornerRound {
                cornersRounded = [.bottomRight, .bottomLeft]
            }
        }
        else if fourthCornerRound {
            cornersRounded = [.bottomLeft]
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            
        }
    }
    
    @IBInspectable var shadowAlpha: Float = 1 {
        didSet {
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if shadowAdded { return }
        shadowAdded = true
        if isCircleEdges {
            cornerRadius = self.frame.size.height/2
        }
        let shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = UIColor.clear
        shadowLayer.layer.shadowColor = shadowColor.cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = shadowOffset //CGSize(width: 1.0, height: 5)
        shadowLayer.layer.shadowOpacity = shadowAlpha
        shadowLayer.layer.shadowRadius = shadowRadius
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        self.superview?.insertSubview(shadowLayer, belowSubview: self)
        
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: cornersRounded,
                                    cornerRadii: roundedCorner)
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.layer.mask = shape
    }
    
    override func layoutSubviews() {
        if shadowAdded { return }
        shadowAdded = true
        if isCircleEdges {
            cornerRadius = self.frame.size.height/2
        }
        let shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = UIColor.clear
        shadowLayer.layer.shadowColor = shadowColor.cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = shadowOffset //CGSize(width: 1.0, height: 5)
        shadowLayer.layer.shadowOpacity = shadowAlpha
        shadowLayer.layer.shadowRadius = shadowRadius
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        self.superview?.insertSubview(shadowLayer, belowSubview: self)
        
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: cornersRounded,
                                    cornerRadii: roundedCorner)
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.layer.mask = shape
    }
}








@IBDesignable class CustomButton: UIButton {
    var shadowAdded: Bool = false
    var previousCornerRadius: CGFloat = 0
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            previousCornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var isCircleEdges: Bool = false {
        didSet {
            if isCircleEdges {
                cornerRadius = self.frame.size.height/2
                layer.cornerRadius = cornerRadius
                layer.masksToBounds = cornerRadius > 0
            }
            else {
                layer.cornerRadius = previousCornerRadius
                layer.masksToBounds = previousCornerRadius > 0
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            
        }
    }
    
    @IBInspectable var shadowAlpha: Float = 1 {
        didSet {
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if shadowAdded { return }
        shadowAdded = true
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        let shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = UIColor.clear
        shadowLayer.layer.shadowColor = shadowColor.cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = shadowOffset //CGSize(width: 1.0, height: 5)
        shadowLayer.layer.shadowOpacity = shadowAlpha
        shadowLayer.layer.shadowRadius = shadowRadius
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        self.superview?.insertSubview(shadowLayer, belowSubview: self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if shadowAdded { return }
        shadowAdded = true
        if isCircleEdges {
            cornerRadius = self.frame.size.height/2
        }
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        let shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = UIColor.clear
        shadowLayer.layer.shadowColor = shadowColor.cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = shadowOffset //CGSize(width: 1.0, height: 5)
        shadowLayer.layer.shadowOpacity = shadowAlpha
        shadowLayer.layer.shadowRadius = shadowRadius
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        self.superview?.insertSubview(shadowLayer, belowSubview: self)
    }
}
