
import UIKit

final class ScrollingViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let scrollViewContentContainer = UIView()
    private let content: UIViewController
        
    init(content: UIViewController) {
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        scrollView.preservesSuperviewLayoutMargins = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        add(child: content, in: scrollView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.frame
        scrollView.contentSize = view.frame.size
        content.view.frame = view.frame
        let intrinsicSize = content.view.intrinsicContentSize
        if view.frame.height < intrinsicSize.height {
            scrollView.contentSize = CGSize(width: view.frame.width, height: intrinsicSize.height)
            content.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: intrinsicSize.height)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = content.title
        configureNavigation()
    }
    
    private func configureNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "beaker"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = Theme.darkPurple
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "calendar"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = Theme.darkPurple
        navigationController?.isToolbarHidden = false
    }
}
