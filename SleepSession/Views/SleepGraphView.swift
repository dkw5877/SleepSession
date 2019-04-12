
import UIKit

final class SleepGraphView: UIView {
    
    var awake = [DataPoint]() {
        didSet {
            drawSleepData(data: awake, color: awakeColor)
            setNeedsDisplay()
        }
    }
    
    var rem = [DataPoint](){
        didSet {
            drawSleepData(data: rem, color: remColor)
            setNeedsDisplay()
        }
    }
    
    var lightSleep = [DataPoint](){
        didSet {
            drawSleepData(data: lightSleep, color: lightColor)
            setNeedsDisplay()
        }
    }
    
    var deep = [DataPoint](){
        didSet {
            drawSleepData(data: deep, color: deepColor)
            setNeedsDisplay()
        }
    }
    
    var awakeColor:UIColor = UIColor.orange
    var remColor:UIColor = UIColor(red: 204/255, green: 60/255, blue: 152/255, alpha: 1.0)
    let lightColor:UIColor = UIColor(red: 115/255, green: 194/255, blue: 143/255, alpha: 1.0)
    let deepColor:UIColor = UIColor(red: 89/255, green: 155/255, blue: 252/255, alpha: 1.0)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawAllData()
    }
    
    private func drawAllData() {
        layer.sublayers?.removeAll()
        drawSleepData(data: deep, color: deepColor)
        drawSleepData(data: lightSleep, color: lightColor)
        drawSleepData(data: rem, color: remColor)
        drawSleepData(data: awake, color: awakeColor)
    }
    
    private func drawSleepData(data:[DataPoint], color:UIColor) {
        guard !data.isEmpty else { return }
        
        for i in 0..<data.count {
            let point = data[i]
            let graphPoint = normalizeValue(dataPoint: point)
            let spacing = Int(frame.width/CGFloat(data.count))
            let yOrigin = frame.height - graphPoint.height
            let columnWidth = graphPoint.width
            let rect = CGRect(x: CGFloat(i) * CGFloat(spacing), y: yOrigin, width: columnWidth, height:  graphPoint.height)
            let column = RectangleLayer(rect: rect, color: color)
            layer.zPosition = CGFloat(point.level)
            layer.addSublayer(column)
        }
    }
        
    private func normalizeValue(dataPoint: DataPoint) -> GraphPoint {
        let totalSleepInMinutes:CGFloat = (8 * 60)
        let percentOfTotal = CGFloat(dataPoint.length)/totalSleepInMinutes
        let normalizedWidth = percentOfTotal * frame.width
        let normalizedHeight = (frame.height/4) * CGFloat(dataPoint.level)
        return GraphPoint(width: normalizedWidth, height: normalizedHeight)
    }
    
}
