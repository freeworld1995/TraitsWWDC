import UIKit

final class View1: UIView {
    private let traitBackgroundColor = UIColor { traitCollection in
        switch traitCollection.appTheme {
        case .yellow: return .yellow
        case .green: return .green
        case .red: return .red
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("GG")
    }
    
    private func setupView() {
        backgroundColor = traitBackgroundColor
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
}
