//
//  CGColor+Extensions.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 02/11/2021.
//

import Foundation
import CoreGraphics

/// Linear interpolation between two CGColor's.
func mix(_ minColor: CGColor, _ maxColor: CGColor, ratio: CGFloat) -> CGColor {
    guard let colorSpace = minColor.colorSpace,
        maxColor.colorSpace == colorSpace else {
        NSLog("Colors have different colorSpaces or no colorSpace.")
        return minColor
    }
    
    guard maxColor.numberOfComponents == minColor.numberOfComponents,
          let minComponents = minColor.components,
          let maxComponents = maxColor.components
    else {
        NSLog("Could not get color components.")
        return minColor
    }
    
    // Mix the components
    let clampedRatio = ratio.clamped()
    let ratioCompl = 1.0-clampedRatio
    let components = zip(minComponents, maxComponents)
        .map { CGFloat(ratioCompl * Double($0) + clampedRatio * Double($1)) }
    
    return CGColor(colorSpace: colorSpace, components: components) ?? minColor
}

// Hue in [0..360]
// Luminosity in [0..1]
// Saturation in [0..1]
func HslFrom(red: CGFloat, green: CGFloat, blue: CGFloat) -> (CGFloat, CGFloat, CGFloat) {
    let r = red.clamped()
    let g = green.clamped()
    let b = blue.clamped()
    
    // Find the range of Channel values
    let cMin = CGFloat.minimum(r, CGFloat.minimum(g, b))
    let cMax = CGFloat.maximum(r, CGFloat.maximum(g, b))
    let cDelta = cMax - cMin
    
    // Determine the Hue
    let hexHue: CGFloat
    if cDelta == 0.0 {
        hexHue = 0.0
    } else if cMax == r { // Red is max
        hexHue = ((g - b) / cDelta).truncatingRemainder(dividingBy: 6.0)
    } else if cMax == g { // Green is max
        hexHue = (b - r) / cDelta + 2.0
    } else { // Blue is max
        hexHue = (r - g) / cDelta + 4.0
    }
    let signedHue = round(hexHue*60)
    let hue = signedHue > 0.0 ? signedHue : (signedHue + 360) // Make negative hue angles positive
    
    let lum = (cMax + cMin) / 2.0
    let sat = cDelta == 0.0 ? 0.0 : (cDelta / (1 - abs(2 * lum - 1)))
    
    return (hue, sat, lum)
}

extension CGFloat {
    /// Keep the value in the 0..1 range
    func clamped() -> CGFloat {
        CGFloat.minimum(CGFloat.maximum(self, 0.0), 1.0)
    }
}
