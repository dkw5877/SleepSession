
import UIKit

final class ProgressView: UIView {
    
    var sleepPercent:CGFloat = 0 {
        didSet {
            sleepProgress.strokeEnd = sleepPercent
            sleepProgress.setNeedsDisplay()
        }
    }
    
    var timePercent:CGFloat = 0 {
        didSet {
            timeProgress.strokeEnd = timePercent
            timeProgress.setNeedsDisplay()
        }
    }
    
    var sleepLine:CGFloat = 25 {
        didSet {
            sleepTrack.lineWidth = sleepLine
            sleepProgress.lineWidth = sleepLine
            sleepProgress.setNeedsDisplay()
        }
    }
    
    var timeLine:CGFloat = 25 {
        didSet {
            timeTrack.lineWidth = timeLine
            timeProgress.lineWidth = timeLine
            timeProgress.setNeedsDisplay()
        }
    }
    
    /* colors */
    var sleepTrackColor:UIColor = Theme.trackDark {
        didSet {
            sleepTrack.strokeColor = sleepTrackColor.cgColor
            sleepTrack.setNeedsDisplay()
        }
    }
    
    var sleepColor:UIColor = Theme.activePurple {
        didSet {
            sleepProgress.strokeColor = sleepColor.cgColor
            sleepProgress.setNeedsDisplay()
        }
    }
    
    var timeColor:UIColor = Theme.white {
        didSet {
            timeProgress.strokeColor = timeColor.cgColor
            timeProgress.setNeedsDisplay()
        }
    }
    
    var timeTrackColor:UIColor = Theme.trackMedium {
        didSet {
            timeTrack.strokeColor = timeTrackColor.cgColor
            timeTrack.setNeedsDisplay()
        }
    }
    
    /* internals */
    private var sleepTrack: CircleLayer!
    private var sleepProgress: CircleLayer!
    private var timeTrack: CircleLayer!
    private var timeProgress: CircleLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sleepTrack = CircleLayer(rect: frame)
        sleepProgress = CircleLayer(rect: frame)
        timeTrack = CircleLayer(rect: frame)
        timeProgress = CircleLayer(rect: frame)
        initializeLayers(frame: frame)
        configureLayers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeLayers(frame:CGRect) {
        let rect = frame.insetBy(dx: sleepLine, dy: sleepLine)
        let innerRect = rect.insetBy(dx: sleepLine + 3, dy: sleepLine + 3)
        sleepTrack.rect = rect
        sleepProgress.rect = rect
        timeTrack.rect = innerRect
        timeProgress.rect = innerRect
    }
        
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        initializeLayers(frame: bounds)
    }
    
    private func configureLayers() {
        configureSleepTrack()
        configureSleepProgress()
        configureTimeTrack()
        configureTimeProgress()
    }
    
    private func configureSleepTrack() {
        layer.addSublayer(sleepTrack)
        sleepTrack.lineWidth = sleepLine
        sleepTrack.strokeColor = sleepTrackColor.cgColor
        sleepTrack.lineCap = .round
    }
    
    private func configureSleepProgress() {
        layer.addSublayer(sleepProgress)
        sleepProgress.lineWidth = sleepLine
        sleepProgress.strokeColor = sleepColor.cgColor
        sleepProgress.lineCap = .round
        sleepProgress.strokeEnd = 0.7
    }
    
    private func configureTimeTrack() {
        layer.addSublayer(timeTrack)
        timeTrack.lineWidth = timeLine
        timeTrack.strokeColor = timeTrackColor.cgColor
    }
    
    private func configureTimeProgress() {
        layer.addSublayer(timeProgress)
        timeProgress.lineWidth = timeLine
        timeProgress.strokeColor = timeColor.cgColor
        timeProgress.lineCap = .round
        timeProgress.strokeEnd = 0.90
    }
    
}
