//
// Created by Stéphane on 18.01.22.
//

import Foundation

class Swe14 {
    struct HouseResult {
        var cusps: [Double]
        var ascmc: [Double]
        var result: Int32
    }

    func houses(tjd_ut: Double, geolat: Double, geolong: Double, hsys: CChar) -> [House] {
        let cuspsPtr = UnsafeMutablePointer<Double>.allocate(capacity: 37)
        let ascmcPtr = UnsafeMutablePointer<Double>.allocate(capacity: 10)
        let _ = swe_houses_ex(tjd_ut, 0, geolat, geolong, Int32(hsys), cuspsPtr, ascmcPtr)
        var house: [House] = []
        for i in 1...12 {
            let angle = Angle.Nothing
            house.append(House.init(object_id: Int32(i), longitude: cuspsPtr[i], angle: angle))
        }
        return house
    }
}

struct House {
    var object_id: Int32
    var longitude: Double
    var split: Swe17.SplitDeg
    var angle: Angle
}

extension House {
    init(object_id: Int32, longitude: Double, angle: Angle) {
        let swe17 = Swe17()
        let split_deg = swe17.split_deg(ddeg: longitude, roundflag: 0)
        self.init(object_id: object_id, longitude: longitude, split: split_deg, angle: angle)
    }
}
