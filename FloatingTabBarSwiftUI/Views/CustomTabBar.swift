//
//  CustomTabBar.swift
//  FloatingTabBarSwiftUI
//
//  Created by Rashid Latif on 19/08/2024.
//

import SwiftUI

struct CustomTabBar: View {
    var activeForeground:Color = .white
    var activeBackground:Color = .blue
    @Namespace var animation
    @Binding var activeTab:TabModel
    @State var selectedImage = "person.fill"
    
    var body: some View {
        let activeTabBarStatus = activeTab == .home || activeTab == .search
        
        HStack(spacing: !activeTabBarStatus ? 0 : 10) {
            HStack(spacing: 0) {
                ForEach(TabModel.allCases, id: \.rawValue) { tab in
                    Button {
                        activeTab = tab
                        self.selectedImage = activeTab == .home ? "person.fill" : "slider.vertical.3"
                    } label: {
                        
                        HStack(spacing: 5) {
                            Image(systemName: tab.rawValue)
                                .font(.title3)
                                .frame(width: 30, height: 30)
                            
                            if activeTab == tab {
                                Text(tab.title)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                            }
                        }//HStack
                        .foregroundStyle(activeTab == tab ? activeForeground : .gray)
                        .padding(.vertical, 2)
                        .padding(.leading, 10)
                        .padding(.trailing, 15)
                        .contentShape(.rect)
                        
                        .background {
                            if activeTab == tab {
                                Capsule()
                                    .fill(activeBackground.gradient)
                                    .matchedGeometryEffect(id: "CurrentTabBar", in: self.animation)
                                
                            }
                        } // Background
                    }// Button
                    .buttonStyle(.plain)
                } // Foreach
            } // HStack
            .padding(.horizontal, 5)
            .frame(height: 45)
            .background {
                Capsule()
                    .fill(activeForeground)
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.07), radius: 5, x: -5, y: -5)
                //add stroke if you want
                /*
                    .overlay(
                        Capsule()
                            .stroke(Color.red, lineWidth: 1)
                    )
                 */
            }
            .zIndex(10)
            
            Button {
                print(activeTab.title)
                
            } label: {
                Image(systemName: selectedImage)
                    .animation(.easeInOut, value: selectedImage)
                    .font(.title3)
                    .frame(width: 42, height: 42)
                    .foregroundStyle(activeForeground)
                    .background(activeBackground.gradient)
                    .clipShape(.circle)
                    .shadow(color: .black.opacity(activeTabBarStatus ? 0.35:0), radius: 5)
            }
            .allowsHitTesting(activeTabBarStatus)
            .offset(x: activeTabBarStatus ? 0: -20)
            .padding(.leading, activeTabBarStatus ? 0 : -42)
            
        }
        .padding(.bottom, 5)
        .animation(.smooth(duration: 0.3, extraBounce: 0), value: activeTab)
        
    } // Body
}



#Preview {
    ContentView()
}
