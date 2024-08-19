//
//  ContentView.swift
//  FloatingTabBarSwiftUI
//
//  Created by Rashid Latif on 19/08/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var activeTab:TabModel = .home
    @State private var isTabBarHidden = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if #available(iOS 18, *) {
                //            TabView(selection: $activeTab) {
                //                Tab.init(value: .home) {
                //                    Text(TabModel.home.title)
                //                        .toolbarVisibility(.hidden, for: .tabBar)
                //                }
                //
                //                Tab.init(value: .search) {
                //                    Text(TabModel.search.title)
                //                        .toolbarVisibility(.hidden, for: .tabBar)
                //                }
                //
                //                Tab.init(value: .notification) {
                //                    Text(TabModel.notification.title)
                //                        .toolbarVisibility(.hidden, for: .tabBar)
                //                }
                //
                //                Tab.init(value: .settings) {
                //                    Text(TabModel.settings.title)
                //                        .toolbarVisibility(.hidden, for: .tabBar)
                //                }
                //            }
            } else {
                TabView(selection: $activeTab) {
                    Text(TabModel.home.title)
                        .tag(TabModel.home)
                        .background {
                            //check if tabbar is not hidden, hide it
                            if !isTabBarHidden {
                                HideTabBar {
                                    isTabBarHidden = true
                                }
                            }
                        }
 
                    Text(TabModel.search.title)
                        .tag(TabModel.search)
                    
                    Text(TabModel.notification.title)
                        .tag(TabModel.notification)
                    
                    Text(TabModel.settings.title)
                        .tag(TabModel.settings)
                        
                }
               
            }
            
            CustomTabBar(activeTab:$activeTab)
        } //End ZStack
        
    }
}


struct HideTabBar: UIViewRepresentable {
    
    var results: () -> ()
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let tabController = view.tabController {
                tabController.tabBar.isHidden = true
                results()
            }
        }
        
        return view
        
    }
}

extension UIView {
    var tabController: UITabBarController? {
        if let controller = sequence(first: self, next: {
            $0.next
        }).first(where: {
            $0 is UITabBarController
        }) as? UITabBarController {
            return controller
        }
        
        return nil
    }
}

#Preview {
    ContentView()
}
