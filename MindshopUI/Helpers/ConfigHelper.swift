//
//  ConfigHelper.swift
//  MindshopUI
//
//  Created by Rene van der Kooi on 24/7/2564 BE.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class ConfigHelper {

    // MARK: - Properties
    private static var sharedConfigHelper: ConfigHelper = {
        let configHelper = ConfigHelper()
        return configHelper
    }()
    
    var appConfig: AppConfig?
    
    // Initialization
    private init() {
        let db = Firestore.firestore()
        let docRef = db.collection("system").document("config")
        docRef.addSnapshotListener { documentSnapshot, error in
            self.appConfig = try? documentSnapshot?.data(as: AppConfig.self)
        }
    }

    // MARK: - Accessors
    class func shared() -> ConfigHelper {
        return sharedConfigHelper
    }
    
    public func getColorScheme() -> String {
        return ""
    }

}
