//
//  ContentView.swift
//  astrology_macos
//
//  Created by Stéphane on 16.01.22.
//

import SwiftUI

struct ContentView: View {
    var swe02: Swe02 = Swe02()
    var body: some View {
        Text("Version: " + swe02.version())
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
