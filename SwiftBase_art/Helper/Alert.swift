//
//  Alert.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 11/23/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

struct Alert {
    @discardableResult
    static func present(title: String? = nil, message: String? = nil, actions: [Alert.Action], from controller: UIViewController) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alertController.addAction(action.alertAction)
        }
        controller.present(alertController, animated: true, completion: nil)
        return alertController
    }

    @discardableResult
    static func present(title: String? = nil, message: String? = nil, actions: Alert.Action..., from controller: UIViewController) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alertController.addAction(action.alertAction)
        }
        controller.present(alertController, animated: true, completion: nil)
        return alertController
    }
}

extension Alert {
    enum Action {
        case ok(handler: (() -> Void)?)
        case retry(handler: (() -> Void)?)
        case cancel
        case custom(title: String, handler: (() -> Void)?)
        case customWithColor(title: String, color: UIColor, handler: (() -> Void)?)
        case done

        private var title: String {
            switch self {
            case .ok:
                return "OK"
            case .retry:
                return "Retry"
            case .cancel:
                return "Cancel"
            case let .custom(title, _):
                return title
            case let .customWithColor(title, _, _):
                return title
            case .done:
                return "Done"
            }
        }

        // Returns the completion handler of our button
        private var handler: (() -> Void)? {
            switch self {
            case let .ok(handler):
                return handler
            case let .retry(handler):
                return handler
            case .cancel:
                return nil
            case let .custom(_, handler):
                return handler
            case let .customWithColor(_, _, handler):
                return handler
            case .done:
                return nil
            }
        }

        var alertAction: UIAlertAction {
            switch self {
            case .cancel:
                return UIAlertAction(title: title, style: .cancel, handler: { _ in
                    self.handler?()
                })
            case let .customWithColor(title, color, _):
                let alert = UIAlertAction(title: title, style: .default, handler: { _ in
                    self.handler?()
                })
                alert.setValue(color, forKey: "titleTextColor")
                return alert
            default:
                return UIAlertAction(title: title, style: .default, handler: { _ in
                    self.handler?()
                })
            }
        }
    }
}
