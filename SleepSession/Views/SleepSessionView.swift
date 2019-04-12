
import UIKit

final class SleepSessionView: UIView {
    
    var nightSleep:NightSleep? {
        didSet {
            timeLabel.text = nightSleep?.length
            percentLabel.text = nightSleep?.percent
            timeInBedLabel.text = nightSleep?.timeInBed
            activityLabel.text = nightSleep?.measure
        }
    }
    
    private var timeLabel:UILabel = {
        let label = UILabel()
        label.textColor = Theme.white
        label.font = Theme.titleBoldFont
        return label
    }()
    
    private var percentLabel:UILabel = {
        let label = UILabel()
        label.textColor = Theme.white
        label.font = Theme.titleBoldFont
        label.textAlignment = .right
        return label
    }()
    
    private var timeInBedLabel:UILabel = {
        let label = UILabel()
        label.textColor = Theme.textPurple
        label.font = Theme.bodyFont
        return label
    }()
    
    private var activityLabel:UILabel = {
        let label = UILabel()
        label.textColor = Theme.textPurple
        label.font = Theme.bodyFont
        label.textAlignment = .right
        return label
    }()
    
    private var statusLabel:UILabel = {
        let label = UILabel()
        label.textColor = Theme.white
        label.font = Theme.bodyFont
        label.text = "♡57bpm △70 ▽40"
        return label
    }()
    
    private let graphView:SleepGraphView = {
        let view = SleepGraphView()
        view.layer.masksToBounds = true
        return view
    }()
    
    private let margin: CGFloat = 16
    private let spacing: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Theme.mediumPurple
        layer.cornerRadius = 10
        addSubview(timeLabel)
        addSubview(percentLabel)
        addSubview(timeInBedLabel)
        addSubview(activityLabel)
        addSubview(graphView)
        addSubview(statusLabel)
        loadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadData() {
        DispatchQueue.global(qos: .userInitiated).async {
            let url = Bundle.main.url(forResource: "data", withExtension: "json")!
            let data = try? Data(contentsOf: url)
            if let data = data {
                let decoder = JSONDecoder()
                let result = try? decoder.decode(SleepData.self, from: data)
                
                DispatchQueue.main.async {
                    if let awake = result?.awake {
                        self.graphView.awake = awake
                    }
                    
                    if let rem = result?.rem {
                        self.graphView.rem = rem
                    }
                    
                    if let light = result?.light {
                        self.graphView.lightSleep = light
                    }
                    
                    if let deep = result?.deep {
                        self.graphView.deep = deep
                    }
                }
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTimeLabel()
        layoutTimeInBedLabel()
        layoutPercentLabel()
        layoutActivityLabel()
        layoutGraphView()
        layoutStatusLabel()
    }
    
    private func layoutTimeLabel() {
        let width = Int(bounds.width * 0.6)
        var textSize = timeLabel.font.sizeOfStringCTFrame(string: timeLabel.text!, constrainedToWidth: CGFloat(width))
        textSize.height = (textSize.height > 22) ? textSize.height : 22
        let frame = CGRect(x: margin, y: margin, width: CGFloat(width), height: 20)
        timeLabel.frame = frame
    }
    
    private func layoutTimeInBedLabel() {
        var textSize = timeInBedLabel.font.sizeOfStringCTFrame(string: timeInBedLabel.text!, constrainedToWidth: timeLabel.frame.width)
        textSize.height = (textSize.height > 22) ? textSize.height : 22
        
        let frame = CGRect(x: margin, y: timeLabel.frame.maxY, width: timeLabel.frame.width, height: 22)
        timeInBedLabel.frame = frame
    }
    
    private func layoutPercentLabel() {
        let frame = CGRect(x: timeLabel.frame.maxX, y: timeLabel.frame.minY, width: (bounds.width - 2 * margin) - timeLabel.frame.width, height: timeLabel.frame.height)
        percentLabel.frame = frame
    }
    
    private func layoutActivityLabel() {
        let frame = CGRect(x: percentLabel.frame.minX, y: percentLabel.frame.maxY, width: percentLabel.frame.width, height: timeInBedLabel.frame.height)
        activityLabel.frame = frame
    }
    
    private func layoutGraphView() {
        let height = Int(bounds.height * 0.40)
        let frame = CGRect(x: timeLabel.frame.minX, y: timeInBedLabel.frame.maxY + spacing, width: bounds.width - (2 * margin), height: CGFloat(height))
        graphView.frame = frame
    }
    
    private func layoutStatusLabel() {
        var textSize = statusLabel.font.sizeOfStringCTFrame(string: statusLabel.text!, constrainedToWidth: graphView.frame.width)
        textSize.height = (textSize.height > 22) ? textSize.height : 22
        let frame = CGRect(x: timeLabel.frame.minX, y: graphView.frame.maxY + spacing, width: graphView.frame.width, height: textSize.height)
        statusLabel.frame = frame
    }
}
