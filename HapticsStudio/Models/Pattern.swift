//
//  Pattern.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import Foundation

struct Pattern {
    var length: HapticTime = 2.0
    var tracks: [Track]
}

extension Pattern {
    static func samplePattern() -> Pattern {
        Pattern(tracks: [
            Track(events: []),
            Track(events: [])
        ])
    }
}
