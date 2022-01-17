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

class Swe02 {
    func version() -> String {
        let version = "2.08"
        let versionCString = version.cString(using: .utf8)
        let versionPtr = UnsafeMutablePointer<Int8>(mutating: versionCString)
        let version_res = String.init(cString: swe_version(versionPtr)) as String
        return version_res
    }
    /*
    func hello_world() -> String
        /*
        /// Get version of swiss ephemeris
        pub fn version() -> String {
            // Get the version
            let mut version = [0; 255];
            let v = unsafe {
                let p = version.as_mut_ptr();
                raw::swe_version(p);
                CStr::from_ptr(p)
            };
            CString::from(v).to_str().unwrap().to_string()
        }*/
        let v = "2.09"
        //let path = Bundle.main.bundlePath
        let path = v.cString(using: String.Encoding.utf8)
        //let param = UnsafeMutablePointer<Int8>(mutating: (path as NSString).utf8String)
        let param = UnsafeMutablePointer<Int8>(mutating: path)
        let vv = String.init(cString: swe_version(param)) as String
        return vv
    }*/
}
