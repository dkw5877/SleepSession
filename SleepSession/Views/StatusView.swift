
import UIKit

final class StatusView: UIView {

    let leftIcon = UIImageView()
    let rightIcon = UIImageView()
 
    var activityLabel:UILabel = {
        let label = UILabel()
        label.textColor = Theme.textPurple
        label.font = Theme.titleFont
        label.text = "Asleep"
        return label
    }()
    
    var lengthLabel:UILabel = {
        let label = UILabel()
        label.textColor = Theme.white
        label.font = Theme.titleBoldFont
        label.text = "7h 9m"
        return label
    }()
    
    var percentLabel:UILabel = {
        let label = UILabel()
        label.textColor = Theme.white
        label.font = Theme.titleBoldFont
        label.textAlignment = .right
        label.text = "78%"
        return label
    }()
    
    var typeLabel:UILabel = {
        let label = UILabel()
        label.textColor = Theme.textPurple
        label.font = Theme.titleFont
        label.textAlignment = .right
        label.text = "Sleep Quality"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(leftIcon)
        addSubview(activityLabel)
        addSubview(lengthLabel)
        addSubview(rightIcon)
        addSubview(typeLabel)
        addSubview(percentLabel)
        leftIcon.image = UIImage(named: "time")
        rightIcon.image = UIImage(named: "sleep")
        rightIcon.tintColor = Theme.darkPurple
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let iconWidth:CGFloat = 40
        let spacing:CGFloat = 8
        let labelWidth = (bounds.width - iconWidth * 2) / 2
        
        var textSize = activityLabel.font.sizeOfStringCTFrame(string: activityLabel.text!, constrainedToWidth: labelWidth)
        textSize.height = (textSize.height > 22) ? textSize.height : 22
        
        leftIcon.frame = CGRect(x: 0, y: 0, width: iconWidth, height: iconWidth)
        activityLabel.frame = CGRect(x: iconWidth + spacing, y: 0, width: labelWidth, height: textSize.height)
        lengthLabel.frame = CGRect(x: activityLabel.frame.origin.x, y: activityLabel.frame.maxY, width: labelWidth, height: textSize.height)
        
        rightIcon.frame = CGRect(x: bounds.width - iconWidth, y: 0, width: iconWidth, height: iconWidth)
        typeLabel.frame = CGRect(x: activityLabel.frame.maxX - (2 * spacing), y: 0, width: labelWidth, height: textSize.height)
        percentLabel.frame = CGRect(x: typeLabel.frame.origin.x, y: typeLabel.frame.maxY, width: labelWidth, height: textSize.height)
    }
}
