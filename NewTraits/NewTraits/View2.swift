import UIKit

final class View2: UIView {
    
    // MARK: Properties
    private let traitBackgroundColor = UIColor { traitCollection in
        switch traitCollection.appTheme {
        case .yellow: return .yellow
        case .green: return .green
        case .red: return .red
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Subview"
        
        return label
    }()
    
    // MARK: Lifecycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("GG")
    }
    
    // MARK: Functions
    
    private func setupView() {
        backgroundColor = traitBackgroundColor
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
        addChildView()
        
        traitOverrides.appTheme = .yellow
    }
    
    private func addChildView() {
        let childView = UIView()
        addSubview(childView)
        childView.translatesAutoresizingMaskIntoConstraints = false
        childView.layer.borderWidth = 1
        childView.layer.borderColor = UIColor.black.cgColor
        
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            childView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            childView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            childView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
