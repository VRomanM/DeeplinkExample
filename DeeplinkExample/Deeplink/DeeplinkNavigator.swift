//
//  DeeplinkNavigator.swift
//  DeeplinkExample
//
//  Created by Роман Вертячих on 07.06.2024.
//

import Foundation

import UIKit

class DeeplinkNavigator {
    
    //MARK: - Properties
    
    static let shared = DeeplinkNavigator()
    
    //MARK: - Private properties
    
    private var alertController = UIAlertController()
    
    //MARK: - Constructions
    
    private init() { }
    
    //MARK: - Function
    
    func proceedToDeeplink(_ type: DeeplinkType) {
        switch type {
        case .activity:
            displayAlert(title: "Activity")
        case .messages(.root):
            displayAlert(title: "Messages Root")
        case .messages(.details(id: let id)):
            displayAlert(title: "Messages Details \(id)")
        case .newListing:
            displayAlert(title: "New Listing")
        case .request(id: let id):
            displayAlert(title: "Request Details \(id)")
        }
    }
    
    //MARK: - Private function
        
    func displayAlert(title: String) {
        alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okButton)
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            if vc.presentedViewController != nil {
                alertController.dismiss(animated: false, completion: {
                    vc.present(self.alertController, animated: true, completion: nil)
                })
            } else {
                vc.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
