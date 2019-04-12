
import UIKit

final class CircleLayer: CAShapeLayer {
    
    var rect:CGRect! {
        didSet {
            path = createPath(rect: rect)
        }
    }
    
    init(rect:CGRect) {
        self.rect = rect
        super.init()
        path = createPath(rect: rect)
        fillColor = nil
        print(self, rect)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createPath(rect:CGRect) -> CGPath {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2
        let startAngle = (-CGFloat.pi/2)
        let endAngle = (1.5 * CGFloat.pi)
        let path =  UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        return path.cgPath
    }
}
