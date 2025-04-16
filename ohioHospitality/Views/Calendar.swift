//
//  Calendar.swift
//  ohioHospitality
//
//  Created by Myroslav Kohut on 4/16/25.
//

import SwiftUI

struct Calendar: View {
    var body: some View {
        WPWebView(url: URL(string: "https://c0h.743.myftpupload.com/wp-booking-calendar/")!)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Calendar()
}
