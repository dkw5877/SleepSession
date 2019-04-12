
import UIKit

final class GradientView: UIView {

    var startColor:UIColor = Theme.darkPurple
    var endColor:UIColor = Theme.appPurple
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [startColor.cgColor, endColor.cgColor]
    }
}
