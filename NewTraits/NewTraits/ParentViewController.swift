import UIKit

enum Theme {
    case red
    case green
    case yellow
}

struct ThemeTrait: UITraitDefinition{
    static let defaultValue: Theme = .red
}

extension UITraitCollection {
    var appTheme: Theme { self[ThemeTrait.self]  }
}

extension UIMutableTraits {
    var appTheme: Theme {
        get { self[ThemeTrait.self] }
        set { self[ThemeTrait.self] = newValue }
    }
}

class ParentViewController: UIViewController {
    // MARK: Properties
    private let backgroundColor = UIColor { traitCollection in
        switch traitCollection.appTheme {
        case .green: return .green
        case .yellow: return .yellow
        case .red: return .red
        }
    }
    
    private var buttonRed: UIButton!
    private var buttonGreen: UIButton!
    private var buttonYellow: UIButton!
    private var buttonPresentChildVC: UIButton!
    
    private var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    // MARK: Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, traitCollection.appTheme)
        view.backgroundColor = backgroundColor
        
        setupButtons()
        setupChildViewController()
        setupView2()
        
        traitOverrides
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function, traitCollection.appTheme)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print(#function, traitCollection.appTheme)
    }
    
    // MARK: Functions
    
    private func setupButtons() {
        view.addSubview(buttonStackView)
        NSLayoutConstraint.activate([
            buttonStackView.heightAnchor.constraint(equalToConstant: 100),
            buttonStackView.widthAnchor.constraint(equalToConstant: 100),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        buttonRed = UIButton(type: .system,
                             primaryAction: UIAction(title: "Red") { [weak self] _ in
            self?.traitOverrides.appTheme = .red
        })
        buttonGreen = UIButton(type: .system,
                             primaryAction: UIAction(title: "Green") { [weak self] _ in
            self?.traitOverrides.appTheme = .green
        })
        buttonYellow = UIButton(type: .system,
                             primaryAction: UIAction(title: "Blue") { [weak self] _ in
            self?.traitOverrides.appTheme = .yellow
        })
        buttonYellow = UIButton(type: .system,
                             primaryAction: UIAction(title: "Blue") { [weak self] _ in
            self?.traitOverrides.appTheme = .yellow
        })
        buttonPresentChildVC = UIButton(type: .system, primaryAction: UIAction(title: "Present Child VC") { [weak self] _ in
            let vc = ChildViewController()
            self?.present(vc, animated: true)
        })
        
        buttonStackView.addArrangedSubview(buttonRed)
        buttonStackView.addArrangedSubview(buttonGreen)
        buttonStackView.addArrangedSubview(buttonYellow)
    }
    
    let vc = ChildViewController()
    
    private func setupChildViewController() {
        view.addSubview(vc.view)
        vc.view.layer.borderColor = UIColor.black.cgColor
        vc.view.layer.borderWidth = 1
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        vc.view.widthAnchor.constraint(equalToConstant: 200).isActive = true
        vc.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        vc.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    private func setupView2() {
        let view2 = View2(frame: CGRect(x: 50, y: 200, width: 100, height: 100))
        view.addSubview(view2)
    }
}

