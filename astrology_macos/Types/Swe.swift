//
//  Swe.swift
//  astrology_macos
//
//  Created by Stéphane on 16.01.22.
//

import Foundation

//import SwiftUI

enum Bg {
    case ChoseNote, ChoseScale, Empty
}

// The Ephemeris file related functions
class Swe02 {
    // Set path ephe file
    func set_ephe_path() {
        let path = Bundle.main.bundlePath
        let param = UnsafeMutablePointer<Int8>(mutating: (path as NSString).utf8String)
        swe_set_ephe_path(param)
    }

    // Close, free memory
    func close() {
        swe_close()
    }

    // Set path ephe file
    private func set_jpl_file() {
        let path = Bundle.main.bundlePath
        let param = UnsafeMutablePointer<Int8>(mutating: (path as NSString).utf8String)
        swe_set_jpl_file(param)
    }

    // Get version of swiss ephemeris
    func version() -> String {
        set_ephe_path()
        let version = ""
        let versionCString = version.cString(using: .utf8)
        let versionPtr = UnsafeMutablePointer<Int8>(mutating: versionCString)
        let res = String.init(cString: swe_version(versionPtr)) as String
        close()
        return res
    }

    // Get library path (don't work on apple)
    func get_library_path() -> String {
        let path = "./"
        let pathCString = path.cString(using: .utf8)
        let pathPtr = UnsafeMutablePointer<Int8>(mutating: pathCString)
        let res = String.init(cString: swe_get_library_path(pathPtr)) as String
        return res
    }

}

struct Swe03CalcUtResult {
    var longitude: Double
    var latitude: Double
    var distance_au: Double
    var speed_longitude: Double
    var speed_latitude: Double
    var speed_distance_au: Double
    var status: Int
    var serr: String
}

extension Swe03CalcUtResult {
    /**
     Resource name to string
     - Parameter ext: Optional extension of file
     - Returns: String with resource inside
     *//*
    func calc_ut(tjd_ut: Double, ipl: Bodies, iflag: Int) -> Self {


    }*/
}

class Swe08 {
    func julday(year: Int, month: Int, day: Int, hour: Double, calandar: Calandar) -> Double {
        let res = swe_julday(Int32(year), Int32(month), Int32(day), hour, Int32(calandar.rawValue))
        return res
    }
}

struct Swe08UtcTimeZoneResult {
    var year: [Int]
    var month: [Int]
    var day: [Int]
    var hour: [Int]
    var calandar: Calandar
}

/*
extension Swe08UtcTimeZoneResult {
   func utc_time_zone(Int year, Int month, Int day, Double hour, Calandar: calandar) ->
}*/

// Enum

enum Bodies: Int {
    case EclNut = -1,
         Sun = 0,
         Moon = 1,
         Mercury = 2,
         Venus = 3,
         Mars = 4,
         Jupiter = 5,
         Saturn = 6,
         Uranus = 7,
         Neptune = 8,
         Pluto = 9,
         MeanNode = 10,
         TrueNode = 11,
         MeanApog = 12,
         OscuApog = 13,
         Earth = 14,
         Chiron = 15,
         Pholus = 16,
         Ceres = 17,
         Pallas = 18,
         Juno = 19,
         Vesta = 20,
         IntpApog = 21,
         IntpPerg = 22,
         NPlanets = 23,
         SouthNode = 24,
         FortunaPart = 25,
         // SE_FICT_OFFSET = 40,
         // SE_NFICT_ELEM = 15,
         // SE_AST_OFFSET = 10000,
         /* Hamburger or Uranian "planets" */
         Cupido = 40,
         Hades = 41,
         Zeus = 42,
         Kronos = 43,
         Apollon = 44,
         Admetos = 45,
         Vulkanus = 46,
         Poseidon = 47,
         /* other fictitious bodies */
         Isis = 48,
         Nibiru = 49,
         Harrington = 50,
         NeptuneLeverrier = 51,
         NeptuneAdams = 52,
         PlutoLowell = 53,
         PlutoPickering = 54,
         /* Asteroid */
         AsteroidAstera = 10005,
         AsteroidHebe = 10006,
         AsteroidIris = 10007,
         AsteroidFlora = 10008,
         AsteroidMetis = 10009,
         AsteroidHygiea = 10010,
         AsteroidUrania = 10030,
         AsteroidIsis = 10042,
         AsteroidHilda = 10153,
         AsteroidPhilosophia = 10227,
         AsteroidSophia = 10251,
         AsteroidAletheia = 10259,
         AsteroidSapientia = 10275,
         AsteroidThule = 10279,
         AsteroidUrsula = 10375,
         AsteroidEros = 10433,
         AsteroidCupido = 10763,
         AsteroidHidalgo = 10944,
         AsteroidLilith = 11181,
         AsteroidAmor = 11221,
         AsteroidKama = 11387,
         AsteroidAphrodite = 11388,
         AsteroidApollo = 11862,
         AsteroidDamocles = 13553,
         AsteroidCruithne = 13753,
         AsteroidPoseidon = 14341,
         AsteroidVulcano = 14464,
         AsteroidZeus = 15731,
         AsteroidNessus = 17066
}

enum Calandar: Int {
    case Julian = 0, Gregorian = 1
}