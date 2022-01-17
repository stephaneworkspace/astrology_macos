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
    let res = swe02.get_library_path()
    /*
    var swe08: Swe08 = Swe08()
    var julday = swe08.julday(year: 1999, month: 0, day: 0, hour: 0.0, calandar: .Gregorian)
    var calc = Swe03CalcUtResult(longitude: 0.0, latitude: 0.0, distance_au: 0.0, speed_longitude: 0.0, speed_latitude: 0.0, speed_distance_au: 0.0, status: 0, serr: "")
    calc.calc_ut(tjd_ut: julday, ipl: Bodies.Sun, iflag: 256)
    */
    swe02.close()
    return res
    //return calc.latitude.formatted()
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
