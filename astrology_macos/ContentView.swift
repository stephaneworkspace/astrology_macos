//
//  ContentView.swift
//  astrology_macos
//
//  Created by Stéphane on 16.01.22.
//

import SwiftUI

func julday() -> String {
    let swe02 = Swe02()
    // swe02.version()
    swe02.set_ephe_path()
    // let res = swe02.get_library_path()

    let swe08: Swe08 = Swe08()
    let julday = swe08.julday(year: 2021, month: 1, day: 24, hour: 0.0, calandar: .gregorian)
    let swe03 = Swe03()
    let res = swe03.calc_ut(tjdUt: julday, ipl: .sun, iflag: .speed)

    var utcTimeZone = TimeZone(year: 2021, month: 1, day: 24, hour: 0, min: 0, sec: 0.0)
    utcTimeZone.utc_time_zone(timezone: 2.0)

    let utcToJd = swe08.utc_to_jd(tz: utcTimeZone, calandar: .gregorian)
    print(utcToJd)

    let swe14 = Swe14()
    let houses = swe14.houses(
            tjdUt: utcToJd.julianDayUt,
            geoLat: res.latitude,
            geoLong: res.longitude,
            hsys: CChar("W") ?? CChar.init())
    for house in houses {
        print(house)

    }
    swe02.close()
    return res.latitude.formatted() + " " + res.longitude.formatted()
}

struct ContentView: View {
    var julDay = julday()
    var body: some View {
        Text("Version: " + julDay).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
