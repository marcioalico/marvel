//
//  UIViewController+Extensions.swift
//  Marvel
//
//  Created by Marcio Alico on 12/28/21.
//

import Foundation
import UIKit

extension UIViewController {
    func errorMessage(message: String, buttonTitle: String? = "OK") {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: buttonTitle, style: .cancel, handler: nil)
        alert.addAction(dismiss)
        
        self.present(alert, animated: true)
    }
}
