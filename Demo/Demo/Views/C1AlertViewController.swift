//
//  C1AlertViewController.swift
//  Demo
//
//  Created by Brian Veitch on 12/24/22.
//

import UIKit
import Sunset

//public enum BVAlertAction {
//    case cancel
//    case action
//}
//
//public enum BVAnimationStyle {
//    case noAnimation, topToBottom, bottomToTop, leftToRight, rightToLeft
//}
//
//public enum BVAlertType: String {
//    case `default` = "smiley.fill"
//    case success = "checkmark"
//    case warning = "exclamationmark.circle.fill"
//    case error = "exclamationmark.triangle.fill"
//    case info = "info"
//}
//
//public class BVAlertView {
//
//    private struct Themes {
//        
//        static let success = ConfigurationV2(buttonBackgroundColor: .systemGreen, buttonTextColor: .white, buttonBorderColor: UIColor.white.cgColor, buttonBorderWidth: 0, buttonCornerRadius: 10, alertBackgroundColor: .white, alertTextColor: .black, alertBorderColor: UIColor.black.cgColor, alertBorderWidth: 0, alertCornerRadius: 10, iconImage: UIImage(systemName: BVAlertType.success.rawValue), iconColor: .white, iconBackgroundColor: .systemGreen)
//        
//        static let error = ConfigurationV2(buttonBackgroundColor: .systemRed, buttonTextColor: .white, buttonBorderColor: UIColor.white.cgColor, buttonBorderWidth: 0, buttonCornerRadius: 10, alertBackgroundColor: .white, alertTextColor: .black, alertBorderColor: UIColor.black.cgColor, alertBorderWidth: 0, alertCornerRadius: 10, iconImage: UIImage(systemName: BVAlertType.error.rawValue), iconColor: .white, iconBackgroundColor: .systemRed)
//        
//        static let warning = ConfigurationV2(buttonBackgroundColor: .systemOrange, buttonTextColor: .white, buttonBorderColor: UIColor.white.cgColor, buttonBorderWidth: 0, buttonCornerRadius: 10, alertBackgroundColor: .white, alertTextColor: .black, alertBorderColor: UIColor.black.cgColor, alertBorderWidth: 0, alertCornerRadius: 10, iconImage: UIImage(systemName: BVAlertType.success.rawValue), iconColor: .white, iconBackgroundColor: .systemOrange)
//        
//        static let info = ConfigurationV2(buttonBackgroundColor: .systemGray, buttonTextColor: .white, buttonBorderColor: UIColor.white.cgColor, buttonBorderWidth: 0, buttonCornerRadius: 10, alertBackgroundColor: .white, alertTextColor: .black, alertBorderColor: UIColor.black.cgColor, alertBorderWidth: 0, alertCornerRadius: 10, iconImage: UIImage(systemName: BVAlertType.success.rawValue), iconColor: .white, iconBackgroundColor: .systemGray)
//        
//        static let `default` = ConfigurationV2(buttonBackgroundColor: .link, buttonTextColor: .white, buttonBorderColor: UIColor.white.cgColor, buttonBorderWidth: 0, buttonCornerRadius: 10, alertBackgroundColor: .white, alertTextColor: .black, alertBorderColor: UIColor.black.cgColor, alertBorderWidth: 0, alertCornerRadius: 10, iconImage: UIImage(systemName: BVAlertType.success.rawValue), iconColor: .white, iconBackgroundColor: .link)
//    }
//    
//    public struct ConfigurationV2 {
//        
//        // buttonView configuration
//        let buttonBackgroundColor: UIColor?
//        let buttonTextColor: UIColor?
//        let buttonBorderColor: CGColor?
//        let buttonBorderWidth: CGFloat?
//        let buttonCornerRadius: CGFloat?
//        
//        // alertView configuration
//        let alertBackgroundColor: UIColor?
//        let alertTextColor: UIColor?
//        let alertBorderColor: CGColor?
//        let alertBorderWidth: CGFloat?
//        let alertCornerRadius: CGFloat?
//        
//        // icon configuration
//        let iconImage: UIImage?
//        let iconColor: UIColor?
//        let iconBackgroundColor: UIColor?
//        
//        init(
//            buttonBackgroundColor: UIColor? = nil,
//            buttonTextColor: UIColor? = nil,
//            buttonBorderColor: CGColor? = nil,
//            buttonBorderWidth: CGFloat? = nil,
//            buttonCornerRadius: CGFloat? = nil,
//            alertBackgroundColor: UIColor? = nil,
//            alertTextColor: UIColor? = nil,
//            alertBorderColor: CGColor? = nil,
//            alertBorderWidth: CGFloat? = nil,
//            alertCornerRadius: CGFloat? = nil,
//            iconImage: UIImage? = nil,
//            iconColor: UIColor? = nil,
//            iconBackgroundColor: UIColor? = nil
//        ) {
//            self.buttonBackgroundColor = buttonBackgroundColor
//            self.buttonTextColor = buttonTextColor
//            self.buttonBorderColor = buttonBorderColor
//            self.buttonBorderWidth = buttonBorderWidth
//            self.buttonCornerRadius = buttonCornerRadius
//            self.alertBackgroundColor = alertBackgroundColor
//            self.alertTextColor = alertTextColor
//            self.alertBorderColor = alertBorderColor
//            self.alertBorderWidth = alertBorderWidth
//            self.alertCornerRadius = alertCornerRadius
//            self.iconImage = iconImage
//            self.iconColor = iconColor
//            self.iconBackgroundColor = iconBackgroundColor
//        }
//    }
//
//    private var buttons: [UIButton] = []
//    private var configuration: ConfigurationV2
//    
//    private var animationStyle: BVAnimationStyle = .noAnimation
//    
//    private var backgroundAlphaTo: CGFloat = 0.6
//    
//    private let backgroundView: UIView = {
//        let backgroundView = UIView()
//        backgroundView.backgroundColor = .black
//        backgroundView.alpha = 0.0
//        return backgroundView
//    }()
//    
//    private let alertView: UIView = {
//        let alert = UIView(frame: .zero)
//        alert.backgroundColor = .white
//        alert.layer.masksToBounds = true
//        alert.layer.cornerRadius = 10
//        alert.translatesAutoresizingMaskIntoConstraints = false
//        return alert
//    }()
//    
//    private let iconContainer: UIView = {
//        let container = UIView()
//        container.translatesAutoresizingMaskIntoConstraints = false
//        container.layer.cornerRadius = 40
//        container.backgroundColor = .link
//        container.layer.borderWidth = 3
//        container.layer.borderColor = UIColor.white.cgColor
//        return container
//    }()
//    
//    private let iconImageView: UIImageView = {
//        let icon = UIImageView()
//        var configuration = UIImage.SymbolConfiguration(pointSize: 36)
//        icon.image = UIImage(systemName: "smiley.fill", withConfiguration: configuration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
//        icon.translatesAutoresizingMaskIntoConstraints = false
//        return icon
//    }()
//    
//    private let stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.distribution = .fill
//        stackView.spacing = 10
//        return stackView
//    }()
//    
//    private let buttonStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.distribution = .fill
//        stackView.spacing = 10
//        return stackView
//    }()
//    
//    private var myTargetView: UIView?
//    
//    // MARK: Initializer
//    
//    init(configuration: ConfigurationV2 = ConfigurationV2()) {
//        self.configuration = configuration
//    }
//    
//    // MARK: CUSTOMIZE
//    
//    func setBackgroundAlpha(alpha: CGFloat) {
//        backgroundAlphaTo = alpha
//    }
//    
//    func addButton(with title: String, style: BVAlertAction = .cancel, completion: ((Bool) -> Void)? = nil) {
//        let button = UIButton(primaryAction: UIAction(handler: { _ in
//            completion?(true)
//            self.dismissAlert()
//        }))
//        button.setTitle(title, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
//        buttonStackView.addArrangedSubview(button)
//        buttons.append(button)
//    }
//    
//    private func setupAlertView(targetView: UIView, animationStyle: BVAnimationStyle, alertType: BVAlertType) {
//        myTargetView = targetView
//        self.animationStyle = animationStyle
//        
//        var configuration1: ConfigurationV2
//        
//        switch alertType {
//        case .success:
//            configuration1 = Themes.success
//        case .error:
//            configuration1 = Themes.error
//        case .warning:
//            configuration1 = Themes.warning
//        case .info:
//            configuration1 = Themes.info
//        default:
//            configuration1 = Themes.default
//        }
//        
//        for button in buttons {
//            button.backgroundColor = configuration.buttonBackgroundColor ?? configuration1.buttonBackgroundColor
//            button.setTitleColor(configuration.buttonTextColor ?? configuration1.buttonTextColor, for: .normal)
//            button.layer.borderWidth = configuration.buttonBorderWidth ?? configuration1.buttonBorderWidth!
//            button.layer.borderColor = configuration.buttonBorderColor ?? configuration1.buttonBorderColor
//            button.layer.cornerRadius = configuration.buttonCornerRadius ?? configuration1.buttonCornerRadius!
//        }
//        
//        alertView.backgroundColor = configuration.alertBackgroundColor ?? configuration1.alertBackgroundColor
//        alertView.layer.borderColor = configuration.alertBorderColor ?? configuration1.alertBorderColor
//        alertView.layer.borderWidth = configuration.alertBorderWidth ?? configuration1.alertBorderWidth!
//        alertView.layer.cornerRadius = configuration.alertCornerRadius ?? configuration1.alertCornerRadius!
//        
//        iconContainer.backgroundColor = configuration.iconBackgroundColor ?? configuration1.buttonBackgroundColor
//        iconImageView.image = configuration.iconImage ?? UIImage(systemName: alertType.rawValue, withConfiguration: UIImage.SymbolConfiguration(pointSize: 36))?.withTintColor(configuration1.buttonTextColor!, renderingMode: .alwaysOriginal)
//    }
//    
//    func showAlert(with title: String, message: String, on viewController: UIViewController, animationStyle: BVAnimationStyle = .noAnimation, alertType: BVAlertType = .default) {
//        guard let targetView = viewController.view else { return }
//        
//        setupAlertView(targetView: targetView, animationStyle: animationStyle, alertType: alertType)
//        
//        backgroundView.frame = targetView.bounds
//        targetView.addSubview(backgroundView)
//        targetView.addSubview(alertView)
//        
//        iconContainer.addSubview(iconImageView)
//        NSLayoutConstraint.activate([
//            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
//            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor)
//        ])
//        
//        switch animationStyle {
//        case .topToBottom:
//            NSLayoutConstraint.activate([
//                alertView.bottomAnchor.constraint(equalTo: targetView.topAnchor),
//                alertView.centerXAnchor.constraint(equalTo: targetView.centerXAnchor),
//                alertView.widthAnchor.constraint(equalToConstant: 300),
//                alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
//            ])
//        case .bottomToTop:
//            NSLayoutConstraint.activate([
//                alertView.topAnchor.constraint(equalTo: targetView.bottomAnchor, constant: 50),
//                alertView.centerXAnchor.constraint(equalTo: targetView.centerXAnchor),
//                alertView.widthAnchor.constraint(equalToConstant: 300),
//                alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
//            ])
//        case .leftToRight:
//            NSLayoutConstraint.activate([
//                alertView.centerYAnchor.constraint(equalTo: targetView.centerYAnchor),
//                alertView.trailingAnchor.constraint(equalTo: targetView.leadingAnchor),
//                alertView.widthAnchor.constraint(equalToConstant: 300),
//                alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
//            ])
//        case .rightToLeft:
//            NSLayoutConstraint.activate([
//                alertView.centerYAnchor.constraint(equalTo: targetView.centerYAnchor),
//                alertView.leadingAnchor.constraint(equalTo: targetView.trailingAnchor),
//                alertView.widthAnchor.constraint(equalToConstant: 300),
//                alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
//            ])
//        default:
//            NSLayoutConstraint.activate([
//                alertView.centerYAnchor.constraint(equalTo: targetView.centerYAnchor),
//                alertView.centerXAnchor.constraint(equalTo: targetView.centerXAnchor),
//                alertView.widthAnchor.constraint(equalToConstant: 300),
//                alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
//            ])
//        }
//        
//        targetView.addSubview(iconContainer)
//        NSLayoutConstraint.activate([
//            iconContainer.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
//            iconContainer.centerYAnchor.constraint(equalTo: alertView.topAnchor),
//            iconContainer.widthAnchor.constraint(equalToConstant: 80),
//            iconContainer.heightAnchor.constraint(equalToConstant: 80)
//        ])
//        
//        alertView.addSubview(stackView)
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 60),
//            stackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 20),
//            stackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -20),
//            stackView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -20)
//        ])
//        
//        let titleLabel = UILabel()
//        titleLabel.text = title
//        titleLabel.font = UIFont.systemFont(ofSize: 24)
//        titleLabel.textColor = configuration.alertTextColor
//        titleLabel.textAlignment = .center
//        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
//        stackView.addArrangedSubview(titleLabel)
//        
//        let messageLabel = UILabel()
//        messageLabel.text = message
//        messageLabel.textColor = configuration.alertTextColor
//        messageLabel.textAlignment = .left
//        messageLabel.numberOfLines = 0
//        stackView.addArrangedSubview(messageLabel)
//        
//        stackView.addArrangedSubview(buttonStackView)
//        
//        UIView.animate(withDuration: 0.2) {
//            self.backgroundView.alpha = self.backgroundAlphaTo
//        } completion: { done in
//            if done {
//                UIView.animate(withDuration: 0.2) {
//                    self.alertView.center = targetView.center
//                    self.iconContainer.center = CGPoint(x: self.alertView.center.x, y: self.alertView.frame.origin.y)
//                }
//            }
//        }
//    }
//    
//    @objc func dismissAlert() {
//        
//        guard let targetView = myTargetView else { return }
//        
//        UIView.animate(withDuration: 0.3) {
//            switch self.animationStyle {
//            case .topToBottom:
//                self.alertView.frame.origin.y = targetView.frame.size.height
//                self.iconContainer.frame.origin.y = self.alertView.frame.origin.y
//            case .leftToRight:
//                self.alertView.frame.origin.x = targetView.frame.size.width
//                self.iconContainer.frame.origin.x = self.alertView.frame.origin.x
//            case .bottomToTop:
//                self.alertView.frame.origin.y = -self.alertView.frame.height
//                self.iconContainer.frame.origin.y = self.alertView.frame.origin.y
//            case .rightToLeft:
//                self.alertView.frame.origin.x = -self.alertView.frame.width
//                self.iconContainer.frame.origin.x = self.alertView.frame.origin.x
//            default:
//                self.alertView.alpha = 0
//                self.iconContainer.alpha = 0
//            }
//        } completion: { done in
//            if done {
//                UIView.animate(withDuration: 0.2, delay: 0) {
//                    self.backgroundView.alpha = 0
//                } completion: { done in
//                    self.alertView.removeFromSuperview()
//                    self.backgroundView.removeFromSuperview()
//                    self.iconContainer.removeFromSuperview()
//                }
//            }
//        }
//    }
//}

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
        let configuration = BVAlertView.ConfigurationV2(alertCornerRadius: 50)
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
        
//        let configuration = BVAlertView.Configuration(
//            alertStyle: BVAlertView.Configuration.Alert(backgroundColor: .yellow, borderWidth: 1),
//            buttonStyle: BVAlertView.Configuration.Button(backgroundColor: .purple, borderColor: UIColor.white.cgColor, borderWidth: 1)
//        )
        
        let configuration = BVAlertView.ConfigurationV2(buttonBackgroundColor: .yellow, buttonTextColor: .black, buttonBorderColor: UIColor.systemRed.cgColor, buttonBorderWidth: 1, alertTextColor: .black, alertCornerRadius: 50)
        
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
