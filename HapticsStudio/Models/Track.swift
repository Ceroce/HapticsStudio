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
