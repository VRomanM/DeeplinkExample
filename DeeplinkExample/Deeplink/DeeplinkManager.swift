//
//  DeeplinkManager.swift
//  DeeplinkExample
//
//  Created by Роман Вертячих on 07.06.2024.
//

import Foundation

enum DeeplinkType {
   enum Messages {
      case root
      case details(id: String)
   }
   case messages(Messages)
   case activity
   case newListing
   case request(id: String)
}

final class DeeplinkManager {
    
    //MARK: - Properties
    static let shared = DeeplinkManager()
    
    //MARK: - Private properties
    
    private var deeplinkType: DeeplinkType?
    
    //MARK: - Constructions
    
    private init() {}
    
    //MARK: - Function
    
    @discardableResult
    func handleDeeplink(url: URL) -> Bool {
       deeplinkType = DeeplinkParser.shared.parseDeepLink(url)
       return deeplinkType != nil
    }
    
    func checkDeepLink() {
        guard let deeplinkType = deeplinkType else {
            return
        }
        
        DeeplinkNavigator.shared.proceedToDeeplink(deeplinkType)
        // reset deeplink after handling
        self.deeplinkType = nil // (1)
    }
}
