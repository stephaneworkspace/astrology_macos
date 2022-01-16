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

class Hello {
    func hello_world() -> String {
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
        let v = version(1)
        
        
        return v.formatted()
    }
}
