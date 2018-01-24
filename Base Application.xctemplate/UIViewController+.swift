//
//  UIViewController+.swift
//

import UIKit

extension UIViewController {
    
    /// Presents an alert controller with given title and message, and a single, "Okay", action.
    func presentAlert(title: String, message: String, completion: @escaping () -> Void = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default) { _ in
            completion()
        }
        
        alertController.addAction(okayAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    /// Presents an alert controller with given title and message, along with a cancel action and an okay action which fires the given closure.
    func presentOptionAlert(title: String, message: String, okayAction: @escaping () -> Void, cancelAction: @escaping () -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okay = UIAlertAction(title: "Okay", style: .default) { _ in
            okayAction()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default) { _ in
            cancelAction()
        }
        
        alertController.addAction(cancel)
        alertController.addAction(okay)
        
        present(alertController, animated: true, completion: nil)
    }
}
