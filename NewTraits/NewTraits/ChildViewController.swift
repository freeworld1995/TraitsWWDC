import UIKit

class ChildViewController: UIViewController {
    private let traitBackgroundColor = UIColor { traitCollection in
        switch traitCollection.appTheme {
        case .green: return .green
        case .yellow: return .yellow
        case .red: return .red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = traitBackgroundColor
        
        let label = UILabel()
        view.addSubview(label)
        label.text = "Child View Controller"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
