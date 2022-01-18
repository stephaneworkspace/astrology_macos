//
//  ContentView.swift
//  astrology_macos
//
//  Created by Stéphane on 16.01.22.
//

import SwiftUI

func julday() -> String {
    var swe02 = Swe02()
    //swe02.version()
    swe02.set_ephe_path()
    //let res = swe02.get_library_path()
    var swe08: Swe08 = Swe08()
    var julday = swe08.julday(year: 2021, month: 1, day: 24, hour: 0.0, calandar: .Gregorian)
    var swe03 = Swe03()
    var res = swe03.calc_ut(tjd_ut: julday, ipl: Bodies.Sun, iflag: .Speed)

    var utc_time_zone = TimeZone(year: 2021, month: 1, day: 24, hour: 0, min: 0, sec: 0.0)
    utc_time_zone.utc_time_zone(timezone: 2.0)

    var utc_to_jd = swe08.utc_to_jd(tz: utc_time_zone, calandar: .Gregorian)
    print(utc_to_jd)

    let swe14 = Swe14()
    let houses = swe14.houses(tjd_ut: utc_to_jd.julian_day_ut, geolat: res.latitude, geolong: res.longitude, hsys: CChar("W") ?? CChar.init())

    print(houses)
    swe02.close()
    return res.latitude.formatted() + " " + res.longitude.formatted()
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
