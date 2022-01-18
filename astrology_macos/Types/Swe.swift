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

// Enum
enum Bodies: Int32 {
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

// Zodiac
enum Signs: Int32 {
    case Aries = 1,
         Taurus = 2,
         Gemini = 3,
         Cancer = 4,
         Leo = 5,
         Virgo = 6,
         Libra = 7,
         Scorpio = 8,
         Sagittarius = 9,
         Capricorn = 10,
         Aquarius = 11,
         Pisces = 12
}

// Angle
enum Angle: Int32 {
    case Nothing = 0,
         Asc = 1,
         Fc = 2,
         Desc = 3,
         Mc = 4
}

// Type of calandar
enum Calandar: Int32 {
    case Julian = 0, Gregorian = 1
}

enum OptionalFlag: Int32 {
    case JplEph = 1,
         SwissEph = 2,
         Moshier = 4,
         Heliocentric = 8,
         TruePosition = 16,
         J2000Equinox = 32,
         NoNutation = 64,
         Speed3 = 128,
         Speed = 256,
         NoGravitanionalDeflection = 512,
         NoAnnualAberration = 1024,
         AstronomicPosition = 1536,
         // AstronomicPosition = OptionalFlag::NoAnnualAberration
         //     | OptionalFlag::NoGravitanionalDeflection,
         EquatorialPosition = 2048,
         XYZCartesianNotPolarCoordinate = 4096,
         Radians = 8192,
         BarycentricPosition = 16384,
         TopocentricPosition = 32768,
         SideralPosition = 65536,
         ICRS = 131072,
         Dpsideps1980 = 262144,
         JplHorApprox = 524288
}

/*
To convert from String to UnsafeMutablePointer<Int8>
let cString = strdup("Hello") // UnsafeMutablePointer<Int8>

func ptrFromAddress<T>(p: UnsafeMutablePointer<T>) -> UnsafeMutablePointer<T> {
    return p
}

func makeCString(from str: String) -> UnsafeMutablePointer<Int8> {
    let count = str.utf8CString.count
    let result: UnsafeMutableBufferPointer<Int8> = UnsafeMutableBufferPointer<Int8>.allocate(capacity: count)
    // func initialize<S>(from: S) -> (S.Iterator, UnsafeMutableBufferPointer<Element>.Index)
    _ = result.initialize(from: str.utf8CString)
    return result.baseAddress!
}
*/