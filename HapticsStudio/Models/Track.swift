//
//  Track.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import Foundation

struct Track: Identifiable {
    let id = UUID()
    
    var events: [TransientEvent]
}

extension Track {
    static let sampleTrack = Track(
        events: [
            TransientEvent(time: 0.0, intensity: 0.2, sharpness: 1.0),
            TransientEvent(time: 0.05, intensity: 0.4, sharpness: 0.8),
            TransientEvent(time: 0.25, intensity: 0.6, sharpness: 0.6),
            TransientEvent(time: 0.3, intensity: 0.8, sharpness: 0.4),
            TransientEvent(time: 0.6, intensity: 1.0, sharpness: 0.2)
        ]
    )
}
