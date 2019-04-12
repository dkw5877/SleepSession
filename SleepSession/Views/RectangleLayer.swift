
import UIKit

final class RectangleLayer: CAShapeLayer {

    var rect:CGRect! {
        didSet {
            path = UIBezierPath(rect: rect).cgPath
        }
    }
    
    init(rect:CGRect, color:UIColor) {
        self.rect = rect
        super.init()
        path = UIBezierPath(rect: rect).cgPath
        fillColor = color.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
