
import UIKit

final class SleepView: UIView {
    
    var nightSleep:NightSleep? {
        didSet {
            sleepSessionView.nightSleep = nightSleep
        }
    }
    
    var sleepLine:CGFloat = 25 {
        didSet {
         progressView.sleepLine = sleepLine
         progressView.setNeedsDisplay()
        }
    }
    
    var timeLine:CGFloat = 25 {
        didSet {
            progressView.timeLine = timeLine
            progressView.setNeedsDisplay()
        }
    }
    
    private var gradient:GradientView!
    private var progressView:ProgressView!
    private var statusView:StatusView!
    private var sleepSessionView:SleepSessionView!
    
    private let spacing: CGFloat = 8
    
    override init(frame: CGRect) {
        gradient = GradientView(frame: frame)
        progressView = ProgressView(frame: .zero)
        statusView = StatusView(frame: .zero)
        sleepSessionView = SleepSessionView()
        super.init(frame: frame)
        addSubview(gradient)
        addSubview(progressView)
        addSubview(statusView)
        addSubview(sleepSessionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradient.frame = bounds
        var height = Int(frame.height * 0.35)
        let center = CGPoint(x: frame.midX, y: frame.midY)
        let width = bounds.width - (layoutMargins.left + layoutMargins.right)
        progressView.frame = CGRect(x: center.x - CGFloat(height)/2, y: layoutMargins.top, width: CGFloat(height) , height: CGFloat(height))
        statusView.frame = CGRect(x: layoutMargins.left, y: progressView.frame.maxY + spacing, width: width, height: 60)
        height = Int(bounds.height * 0.20)
        height = (height < 160) ? 160 : height
        sleepSessionView.frame = CGRect(x: layoutMargins.left, y: statusView.frame.maxY, width: width, height: CGFloat(height))
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: sleepSessionView.frame.maxY)
    }
    
}
