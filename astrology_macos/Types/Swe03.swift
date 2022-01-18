//
// Created by Stéphane on 18.01.22.
//
// The functions swe_calc_ut() and swe_calc()
//
// Before calling one of these functions or any other Swiss Ephemeris function,
// it is strongly recommended to call the function swe_set_ephe_path(). Even if
// you don’t want to set an ephemeris path and use the Moshier ephemeris, it is
// nevertheless recommended to call swe_set_ephe_path(NULL), because this
// function makes important initializations. If you don’t do that, the Swiss
// Ephemeris may work but the results may be not 100% consistent.
//

import Foundation

class Swe03 {
    struct CalcUtResult {
        var longitude: Double
        var latitude: Double
        var distance_au: Double
        var speed_longitude: Double
        var speed_latitude: Double
        var speed_distance_au: Double
        var status: Int32
        var serr: String
    }

    func calc_ut(tjd_ut: Double, ipl: Bodies, iflag: OptionalFlag) -> CalcUtResult {
        let xxPtr = UnsafeMutablePointer<Double>.allocate(capacity: 6)
        let serrPtr = UnsafeMutablePointer<Int8>.allocate(capacity: 255)
        let status: Int32
        // TODO make proper Node South/True later
        if ipl == Bodies.SouthNode {
            status = swe_calc_ut(tjd_ut, Bodies.TrueNode.rawValue, iflag.rawValue, xxPtr, serrPtr)
        } else {
            status = swe_calc_ut(tjd_ut, ipl.rawValue, iflag.rawValue, xxPtr, serrPtr)
        }
        // TODO make proper Node South/True later
        if ipl == Bodies.SouthNode {
            xxPtr[0] += 180.0
            if xxPtr[0] >= 360.0 {
                xxPtr[0] -= 360.0
            }
        }
        let res = CalcUtResult(longitude: xxPtr[0], latitude: xxPtr[1], distance_au: xxPtr[2], speed_longitude: xxPtr[3], speed_latitude: xxPtr[4], speed_distance_au: xxPtr[5], status: status, serr: String(cString: serrPtr))
        free(xxPtr)
        free(serrPtr)
        return res
    }
}