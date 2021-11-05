//
//  TransientEvent.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import Foundation

/// Time location, from the start of the pattern, in seconds.
typealias HapticTime = Float

/// Intensity of a haptic event, in the 0..1 range.
typealias HapticIntensity = Float

/// Sharpness of a haptic event, in the 0..1 range.
typealias HapticSharpness = Float

struct TransientEvent: Identifiable {
    let id = UUID()
    var time: HapticTime
    var intensity: HapticIntensity
    var sharpness: HapticSharpness
}
