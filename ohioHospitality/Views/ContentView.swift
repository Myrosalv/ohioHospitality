import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showSidebar = true

    var body: some View {
        HStack(spacing: 0) {
            if showSidebar {
                SideBar(selectedTab: $selectedTab, showSidebar: $showSidebar)
            } else {
                EmptyView()
            }

            ZStack(alignment: .topLeading) {
                TabView(selection: $selectedTab) {
                    WPWebView(url: URL(string: "https://c0h.743.myftpupload.com/sample-page/")!)
                        .edgesIgnoringSafeArea(.all)
                        .tag(0)

                    Calendar()
                        .tag(1)

                    Text("Other Page")
                        .tag(2)
                }

                // Sidebar toggle button
                Button(action: {
                    withAnimation {
                        showSidebar.toggle()
                    }
                }) {
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
