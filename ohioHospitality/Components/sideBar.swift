import SwiftUI

struct SideBar: View {
    @Binding var selectedTab: Int
    @Binding var showSidebar: Bool

    var body: some View {
        VStack(spacing: 20) {
            ForEach(TabbedItems.allCases, id: \.self) { item in
                Button {
                    selectedTab = item.rawValue
                } label: {
                    CustomTabItem(systemImageName: item.iconName,
                                  title: item.title,
                                  isActive: (selectedTab == item.rawValue))
                }
            }
            Spacer()
        }
        .frame(width: 100)
        .background(Color.purple.opacity(0.2))
        .transition(.move(edge: .leading))
    }

    func CustomTabItem(systemImageName: String, title: String, isActive: Bool) -> some View {
        VStack(spacing: 6) {
            Image(systemName: systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(isActive ? .purple : .gray)

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

enum TabbedItems: Int, CaseIterable {
    case web = 0
    case calendar
    case other

    var title: String {
        switch self {
        case .web: return "Home"
        case .calendar: return "Calendar"
        case .other: return "Other"
        }
    }

    var iconName: String {
        switch self {
        case .web: return "house.fill"
        case .calendar: return "calendar"
        case .other: return "ellipsis"
        }
    }
}
