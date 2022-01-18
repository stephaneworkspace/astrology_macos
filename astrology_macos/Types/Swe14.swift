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

    func houses(tjd_ut: Double, geolat: Double, geolong: Double, hsys: CChar) {
        let cuspsPtr = UnsafeMutablePointer<Double>.allocate(capacity: 37)
        let ascmcPtr = UnsafeMutablePointer<Double>.allocate(capacity: 10)
        let result = swe_houses_ex(tjd_ut, 0, geolat, geolong, Int32(hsys), cuspsPtr, ascmcPtr)
        /*
        let cusps: [Double] init
        for i in 1...12 {
            cusps.append(cuspsPtr[i])
        }*/
        //let res = HouseResult(cusps, ascmcPtr.pointee, result)
    }
}

struct House {
    var object_id: Int32
    var longitude: Double
    var splt: SplitDeg
    var angle: Angle
}

struct SplitDeg {
    var print: String
    var deg: Int32
    var min: Int32
    var sec: Int32
    var cdegfr: Double
    var sign: Signs
    var result: Double
}