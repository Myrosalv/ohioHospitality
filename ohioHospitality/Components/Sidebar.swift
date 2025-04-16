//
//  Sidebar.swift
//  ohioHospitality
//
//  Created by Disukhi Ahmed on 4/16/25.
//

import SwiftUI

struct Sidebar: View {
    @State private var selectedTab = 0
    @State private var showSidebar = false
    
    var body: some View {
        HStack(spacing: 0) {
            if showSidebar {
                VStack(spacing: 20) {
                    ForEach((TabbedItems.allCases), id: \.self) { item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName,  title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                    Spacer()
                }
                .frame(width: 100)
                .background(Color.purple.opacity(0.2))
                .transition(.move(edge: .leading))
            }

            ZStack(alignment: .topLeading) {
                TabView(selection: $selectedTab) {
                    home()
                        .tag(0)
                    tempView()
                        .tag(1)
                    anotherTemp()
                        .tag(2)
                }

                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                       
                        
                        showSidebar.toggle()
                    }
                 
                }) {
                        Text("---")

                }
                .padding()
            }
        }
    }
}

enum TabbedItems: Int, CaseIterable {
    case home = 0
    case book
    case chat

    var title: String {
        switch self {
        case .home: return "Home"
        case .book: return "Book"
        case .chat: return "Chat"
        }
    }

    var iconName: String {
        switch self {
        case .home: return "images-40"
        case .book: return "batImage"
        case .chat: return "chImage"
        }
    }
}

extension Sidebar {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        VStack(spacing: 6) {
            Image(imageName)
                .resizable()
                .renderingMode(.original)
            if isActive {
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .background(isActive ? Color.purple.opacity(0.3) : Color.clear)
        .cornerRadius(12)
    }
}

#Preview {
    Sidebar()
}
