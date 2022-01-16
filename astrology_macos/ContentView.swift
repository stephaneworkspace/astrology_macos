//
//  ContentView.swift
//  astrology_macos
//
//  Created by Stéphane on 16.01.22.
//

import SwiftUI

struct ContentView: View {
    var hello: Hello = Hello()
    var body: some View {
        Text("Hello, world!" + hello.hello_world())
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
