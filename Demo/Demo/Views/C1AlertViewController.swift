//
//  C1AlertViewController.swift
//  Demo
//
//  Created by Brian Veitch on 12/24/22.
//

import UIKit
import Sunset

public enum BVAlertAction {
    case cancel
    case action
}

public enum BVAnimationStyle {
    case noAnimation, topToBottom, bottomToTop, leftToRight, rightToLeft
}

public enum BVAlertType: String {
    case `default` = "smiley.fill"
    case success = "checkmark"
    case warning = "exclamationmark.circle.fill"
    case error = "exclamationmark.triangle.fill"
    case info = "info.circle"
}

public class BVAlertView {

    private struct Themes {
        static let success = Configuration(alertStyle: BVAlertView.Configuration.Alert(backgroundColor: UIColor.white, borderColor: UIColor.white.cgColor, borderWidth: 0), buttonStyle: BVAlertView.Configuration.Button(backgroundColor: UIColor.systemGreen, borderColor: UIColor.white.cgColor, borderWidth: 1, cornerRadius: 5))
        static let error = Configuration(alertStyle: BVAlertView.Configuration.Alert(backgroundColor: UIColor.white, borderColor: UIColor.white.cgColor, borderWidth: 0), buttonStyle: BVAlertView.Configuration.Button(backgroundColor: UIColor.systemRed, borderColor: UIColor.white.cgColor, borderWidth: 1, cornerRadius: 5))
        static let warning = Configuration(alertStyle: BVAlertView.Configuration.Alert(backgroundColor: UIColor.white, borderColor: UIColor.white.cgColor, borderWidth: 0), buttonStyle: BVAlertView.Configuration.Button(backgroundColor: UIColor.systemOrange, borderColor: UIColor.white.cgColor, borderWidth: 1, cornerRadius: 5))
        static let `default` = Configuration(alertStyle: BVAlertView.Configuration.Alert(backgroundColor: UIColor.white, borderColor: UIColor.white.cgColor, borderWidth: 0), buttonStyle: BVAlertView.Configuration.Button(backgroundColor: UIColor.link, borderColor: UIColor.white.cgColor, borderWidth: 1, cornerRadius: 5))
        static let info = Configuration(alertStyle: BVAlertView.Configuration.Alert(backgroundColor: UIColor.white, borderColor: UIColor.white.cgColor, borderWidth: 0), buttonStyle: BVAlertView.Configuration.Button(backgroundColor: UIColor(hex: "#A7C4A0ff")!, borderColor: UIColor.black.cgColor, borderWidth: 0, cornerRadius: 5, textColor: .black))
    }
    
    public struct Configuration {
        
        let alertStyle: Alert
        let buttonStyle: Button
        let backgroundAlphaTo: CGFloat = 0.60
        
        public struct Alert {
            // overall view
            let backgroundColor: UIColor
            let borderColor: CGColor
            let borderWidth: CGFloat
            init(backgroundColor: UIColor = .white, borderColor: CGColor = UIColor.black.cgColor, borderWidth: CGFloat = 0) {
                self.backgroundColor = backgroundColor
                self.borderColor = borderColor
                self.borderWidth = borderWidth
            }
        }
        
        public struct Button {
            let backgroundColor: UIColor
            let borderColor: CGColor
            let borderWidth: CGFloat
            let cornerRadius: CGFloat
            let textColor: UIColor
            init(backgroundColor: UIColor = .link, borderColor: CGColor = UIColor.black.cgColor, borderWidth: CGFloat = 0, cornerRadius: CGFloat = 4, textColor: UIColor = .white) {
                self.backgroundColor = backgroundColor
                self.borderWidth = borderWidth
                self.borderColor = borderColor
                self.cornerRadius = cornerRadius
                self.textColor = textColor
            }
        }
        
        public struct Title {
            let textColor: UIColor = .black
        }
        
        public struct Message {
            let textColor: UIColor = .black
        }
        
        init(alertStyle: Alert = Alert(), buttonStyle: Button = Button()) {
            self.alertStyle = alertStyle
            self.buttonStyle = buttonStyle
        }
    }
    
    private var buttons: [UIButton] = []
    
    private var animationStyle: BVAnimationStyle = .noAnimation
    
    private var buttonStyle: Configuration.Button
    private var alertStyle: Configuration.Alert
    private var backgroundAlphaTo: CGFloat = 0.6
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.0
        return backgroundView
    }()
    
    private let alertView: UIView = {
        let alert = UIView(frame: .zero)
        alert.backgroundColor = .white
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 10
        alert.translatesAutoresizingMaskIntoConstraints = false
        return alert
    }()
    
    private let iconContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 40
        container.backgroundColor = .link
        container.layer.borderWidth = 3
        container.layer.borderColor = UIColor.white.cgColor
        return container
    }()
    
    private let iconImageView: UIImageView = {
        let icon = UIImageView()
        var configuration = UIImage.SymbolConfiguration(pointSize: 36)
        icon.image = UIImage(systemName: "smiley.fill", withConfiguration: configuration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private var myTargetView: UIView?
    
    // MARK: Initializer
    
    init(configuration: Configuration = Configuration()) {
        self.alertStyle = configuration.alertStyle
        self.buttonStyle = configuration.buttonStyle
    }
    
    // MARK: CUSTOMIZE
    
    func setBackgroundAlpha(alpha: CGFloat) {
        backgroundAlphaTo = alpha
    }
    
    func addButton(with title: String, style: BVAlertAction = .cancel, completion: ((Bool) -> Void)? = nil) {
        let button = UIButton(primaryAction: UIAction(handler: { _ in
            completion?(true)
            self.dismissAlert()
        }))
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        buttonStackView.addArrangedSubview(button)
        buttons.append(button)
    }
    
    private func setupAlertView(targetView: UIView, animationStyle: BVAnimationStyle, alertType: BVAlertType) {
        myTargetView = targetView
        self.animationStyle = animationStyle
        
        switch alertType {
        case .default:
            alertStyle = Themes.default.alertStyle
            buttonStyle = Themes.default.buttonStyle
        case .success:
            alertStyle = Themes.success.alertStyle
            buttonStyle = Themes.success.buttonStyle
        case .warning:
            alertStyle = Themes.warning.alertStyle
            buttonStyle = Themes.warning.buttonStyle
        case .error:
            alertStyle = Themes.error.alertStyle
            buttonStyle = Themes.error.buttonStyle
        case .info:
            alertStyle = Themes.info.alertStyle
            buttonStyle = Themes.info.buttonStyle
        }
        
        for button in buttons {
            button.backgroundColor = buttonStyle.backgroundColor
            button.setTitleColor(buttonStyle.textColor, for: .normal)
            button.layer.cornerRadius = buttonStyle.cornerRadius
            button.layer.borderWidth = buttonStyle.borderWidth
            button.layer.borderColor = buttonStyle.borderColor
        }
        
        // set up alertView
        alertView.backgroundColor = alertStyle.backgroundColor
        alertView.layer.borderColor = alertStyle.borderColor
        alertView.layer.borderWidth = alertStyle.borderWidth
        
        // icon area
        iconImageView.image = UIImage(systemName: alertType.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 36))?.withTintColor(buttonStyle.textColor, renderingMode: .alwaysOriginal)
        iconContainer.backgroundColor = buttonStyle.backgroundColor
    }
    
    func showAlert(with title: String, message: String, on viewController: UIViewController, animationStyle: BVAnimationStyle = .noAnimation, alertType: BVAlertType = .default) {
        guard let targetView = viewController.view else { return }
        
        setupAlertView(targetView: targetView, animationStyle: animationStyle, alertType: alertType)
        
        //        myTargetView = targetView
        
        //        self.animationStyle = animationStyle
        
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        targetView.addSubview(alertView)
        
        iconContainer.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor)
        ])
        
        switch animationStyle {
        case .topToBottom:
            NSLayoutConstraint.activate([
                alertView.bottomAnchor.constraint(equalTo: targetView.topAnchor),
                alertView.centerXAnchor.constraint(equalTo: targetView.centerXAnchor),
                alertView.widthAnchor.constraint(equalToConstant: 300),
                alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
            ])
        case .bottomToTop:
            NSLayoutConstraint.activate([
                alertView.topAnchor.constraint(equalTo: targetView.bottomAnchor),
                alertView.centerXAnchor.constraint(equalTo: targetView.centerXAnchor),
                alertView.widthAnchor.constraint(equalToConstant: 300),
                alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
            ])
        case .leftToRight:
            NSLayoutConstraint.activate([
                alertView.centerYAnchor.constraint(equalTo: targetView.centerYAnchor),
                alertView.trailingAnchor.constraint(equalTo: targetView.leadingAnchor),
                alertView.widthAnchor.constraint(equalToConstant: 300),
                alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
            ])
        case .rightToLeft:
            NSLayoutConstraint.activate([
                alertView.centerYAnchor.constraint(equalTo: targetView.centerYAnchor),
                alertView.leadingAnchor.constraint(equalTo: targetView.trailingAnchor),
                alertView.widthAnchor.constraint(equalToConstant: 300),
                alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
            ])
        default:
            NSLayoutConstraint.activate([
                alertView.centerYAnchor.constraint(equalTo: targetView.centerYAnchor),
                alertView.centerXAnchor.constraint(equalTo: targetView.centerXAnchor),
                alertView.widthAnchor.constraint(equalToConstant: 300),
                alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
            ])
        }
        
        targetView.addSubview(iconContainer)
        NSLayoutConstraint.activate([
            iconContainer.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            iconContainer.centerYAnchor.constraint(equalTo: alertView.topAnchor),
            iconContainer.widthAnchor.constraint(equalToConstant: 80),
            iconContainer.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        alertView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -20)
        ])
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        stackView.addArrangedSubview(titleLabel)
        
        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.textAlignment = .left
        messageLabel.numberOfLines = 0
        stackView.addArrangedSubview(messageLabel)
        
        stackView.addArrangedSubview(buttonStackView)
        
        UIView.animate(withDuration: 0.2) {
            self.backgroundView.alpha = self.backgroundAlphaTo
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.2) {
                    self.alertView.center = targetView.center
                    self.iconContainer.center = CGPoint(x: self.alertView.center.x, y: self.alertView.frame.origin.y)
                }
            }
        }
    }
    
    @objc func dismissAlert() {
        
        guard let targetView = myTargetView else { return }
        
        UIView.animate(withDuration: 0.3) {
            switch self.animationStyle {
            case .topToBottom:
                self.alertView.frame.origin.y = targetView.frame.size.height
                self.iconContainer.frame.origin.y = self.alertView.frame.origin.y
            case .leftToRight:
                self.alertView.frame.origin.x = targetView.frame.size.width
                self.iconContainer.frame.origin.x = self.alertView.frame.origin.x
            case .bottomToTop:
                self.alertView.frame.origin.y = -self.alertView.frame.height
                self.iconContainer.frame.origin.y = self.alertView.frame.origin.y
            case .rightToLeft:
                self.alertView.frame.origin.x = -self.alertView.frame.width
                self.iconContainer.frame.origin.x = self.alertView.frame.origin.x
            default:
                self.alertView.alpha = 0
                self.iconContainer.alpha = 0
            }
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.2, delay: 0) {
                    self.backgroundView.alpha = 0
                } completion: { done in
                    self.alertView.removeFromSuperview()
                    self.backgroundView.removeFromSuperview()
                    self.iconContainer.removeFromSuperview()
                }
            }
        }
    }
}

class C1AlertViewController: UIViewController {
    
    let alertStates: [BVAnimationStyle] = [.topToBottom, .leftToRight, .bottomToTop, .rightToLeft, .noAnimation]
    var alertState = 0
    
    @IBOutlet var alertMeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func genericAlertTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Hello World", message: "This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Some Action", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func alertMeButtonTapped(_ sender: UIButton) {
        
        let customAlert = BVAlertView()
        
        customAlert.addButton(with: "Some Action", style: .action) { _ in
            print("call back action")
        }
        customAlert.addButton(with: "Another action", style: .cancel) { _ in
            print("canother action called")
        }
        customAlert.addButton(with: "Cancel", style: .cancel, completion: { _ in
            print("canceled")
        })
        customAlert.showAlert(with: "Hello World", message: "This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert", on: self, animationStyle: alertStates[alertState], alertType: .success)
        alertState = (alertState + 1) % 5
    }
    
    
    @IBAction func failureButtonTapped(_ sender: Any) {
        let customAlert = BVAlertView()
        
        customAlert.addButton(with: "Some Action", style: .action) { _ in
            print("call back action")
        }
        customAlert.addButton(with: "Another action", style: .cancel) { _ in
            print("canother action called")
        }
        customAlert.addButton(with: "Cancel", style: .cancel, completion: { _ in
            print("canceled")
        })
        customAlert.showAlert(with: "Hello World", message: "This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert", on: self, animationStyle: alertStates[alertState], alertType: .error)
        alertState = (alertState + 1) % 5
    }
    
    @IBAction func warningButtonTapped(_ sender: Any) {
        let customAlert = BVAlertView()
        
        customAlert.addButton(with: "Some Action", style: .action) { _ in
            print("call back action")
        }
        customAlert.addButton(with: "Another action", style: .cancel) { _ in
            print("canother action called")
        }
        customAlert.addButton(with: "Cancel", style: .cancel, completion: { _ in
            print("canceled")
        })
        customAlert.showAlert(with: "Hello World", message: "This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert", on: self, animationStyle: alertStates[alertState], alertType: .warning)
        alertState = (alertState + 1) % 5
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        
        let customAlert = BVAlertView()
        
        customAlert.addButton(with: "Some Action", style: .action) { _ in
            print("call back action")
        }
        customAlert.addButton(with: "Another action", style: .cancel) { _ in
            print("canother action called")
        }
        customAlert.addButton(with: "Cancel", style: .cancel, completion: { _ in
            print("canceled")
        })
        customAlert.showAlert(with: "Hello World", message: "This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert", on: self, animationStyle: alertStates[alertState], alertType: .info)
        alertState = (alertState + 1) % 5
    }
    
    
    @IBAction func defaultButtonTapped(_ sender: Any) {
        
        let customAlert = BVAlertView()
        
        customAlert.addButton(with: "Some Action", style: .action) { _ in
            print("call back action")
        }
        customAlert.addButton(with: "Another action", style: .cancel) { _ in
            print("canother action called")
        }
        customAlert.addButton(with: "Cancel", style: .cancel, completion: { _ in
            print("canceled")
        })
        customAlert.showAlert(with: "Hello World", message: "This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert", on: self, animationStyle: alertStates[alertState], alertType: .default)
        alertState = (alertState + 1) % 5
    }
    
    
    @IBAction func customButtonTapped(_ sender: Any) {
        
        let configuration = BVAlertView.Configuration(
            alertStyle: BVAlertView.Configuration.Alert(backgroundColor: .yellow, borderWidth: 1),
            buttonStyle: BVAlertView.Configuration.Button(backgroundColor: .purple, borderColor: UIColor.white.cgColor, borderWidth: 1)
        )
        
        let customAlert = BVAlertView(configuration: configuration)
        
        customAlert.addButton(with: "Some Action", style: .action) { _ in
            print("call back action")
        }
        customAlert.addButton(with: "Another action", style: .cancel) { _ in
            print("canother action called")
        }
        customAlert.addButton(with: "Cancel", style: .cancel, completion: { _ in
            print("canceled")
        })
        customAlert.showAlert(with: "Hello World", message: "This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert. This is my alert", on: self, animationStyle: alertStates[alertState], alertType: .default)
        alertState = (alertState + 1) % 5
    }
    
}
