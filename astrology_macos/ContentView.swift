//
//  ContentView.swift
//  astrology_macos
//
//  Created by Stéphane on 16.01.22.
//

import SwiftUI

func julday() -> String {
    var swe02 = Swe02()
    var path = swe02.set_ephe_path()
    var swe08: Swe08 = Swe08()
    var julday = swe08.julday(year: 1999, month: 0, day: 0, hour: 0.0, calandar: .Gregorian).formatted()
    swe02.close()
    return julday
}

struct ContentView: View {
    var j = julday()
    var body: some View {
        Text("Version: " + j).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
