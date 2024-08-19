//
//  TabModel.swift
//  FloatingTabBarSwiftUI
//
//  Created by Rashid Latif on 19/08/2024.
//

import SwiftUI

enum TabModel: String, CaseIterable {
    case home = "house"
    case search = "magnifyingglass"
    case notification = "bell"
    case settings = "gearshape"
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .notification:
            return "Notifications"
        case .settings:
            return "Settings"
        }
    }
    
    
    
}
