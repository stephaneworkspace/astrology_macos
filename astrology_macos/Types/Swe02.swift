//
// Created by Stéphane on 18.01.22.
//
// The Ephemeris file related functions
//

import Foundation

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
    func set_jpl_file() {
        let path = Bundle.main.bundlePath
        let param = UnsafeMutablePointer<Int8>(mutating: (path as NSString).utf8String)
        swe_set_jpl_file(param)
    }

    // Get version of swiss ephemeris
    func version() -> String {
        let versionPtr = UnsafeMutablePointer<Int8>.allocate(capacity: 255)
        let res = String.init(cString: swe_version(versionPtr)) as String
        return res
    }

    // Get library path (don't work on apple)
    func get_library_path() -> String {
        let pathPtr = UnsafeMutablePointer<Int8>.allocate(capacity: 255)
        let res = String.init(cString: swe_get_library_path(pathPtr)) as String
        free(pathPtr)
        return res
    }
}
