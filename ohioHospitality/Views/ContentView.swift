//
//  ContentView.swift
//  ohioHospitality
//
//  Created by Myroslav Kohut on 4/16/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WPWebView(url: URL(string: "https://c0h.743.myftpupload.com/sample-page/")!)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
