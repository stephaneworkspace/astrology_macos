//
// Created by Stéphane on 18.01.22.
//
// Date and time conversion functions
//

import Foundation

class Swe08 {
    func julday(year: Int32, month: Int32, day: Int32, hour: Double, calandar: Calandar) -> Double {
        let res = swe_julday(year, month, day, hour, calandar.rawValue)
        return res
    }
}

struct Swe08UtcTimeZone {
    var year: Int32
    var month: Int32
    var day: Int32
    var hour: Int32
    var min: Int32
    var sec: Double
}

extension Swe08UtcTimeZone {
    mutating func utc_time_zone(timezone: Double) {
        let yearPtr = UnsafeMutablePointer<Int32>.allocate(capacity: 2)
        let monthPtr = UnsafeMutablePointer<Int32>.allocate(capacity: 2)
        let dayPtr = UnsafeMutablePointer<Int32>.allocate(capacity: 2)
        let hourPtr = UnsafeMutablePointer<Int32>.allocate(capacity: 2)
        let minPtr = UnsafeMutablePointer<Int32>.allocate(capacity: 2)
        let secPtr = UnsafeMutablePointer<Double>.allocate(capacity: 2)
        swe_utc_time_zone(year, month, day, hour, min, sec, timezone, yearPtr, monthPtr, dayPtr, hourPtr, minPtr, secPtr)
        year = yearPtr.pointee
        month = monthPtr.pointee
        day = dayPtr.pointee
        hour = hourPtr.pointee
        min = minPtr.pointee
        sec = secPtr.pointee
        free(yearPtr)
        free(monthPtr)
        free(dayPtr)
        free(hourPtr)
        free(minPtr)
        free(secPtr)
    }
}
