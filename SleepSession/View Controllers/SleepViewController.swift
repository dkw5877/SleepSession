
import UIKit

final class SleepViewController: UIViewController {

    private let sleepView = SleepView(frame: UIScreen.main.bounds)
   
    override func loadView() {
        view = sleepView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "25 Jul 2019"
        view.backgroundColor = .white
        sleepView.nightSleep = NightSleep()
    }
        
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let size = view.bounds.size
        updateLayout(size:size)
    }
    
    private func updateLayout(size:CGSize) {
        
        if size.width > size.height {
            sleepView.sleepLine = 15.0
            sleepView.timeLine = 15.0
        } else {
            sleepView.sleepLine = 25.0
            sleepView.timeLine = 25.0
        }
        
    }

}

