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
    private func set_ephe_path() {
        let path = Bundle.main.bundlePath
        let param = UnsafeMutablePointer<Int8>(mutating: (path as NSString).utf8String)
        swe_set_ephe_path(param)
    }

    // Close, free memory
    private func close() {
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
