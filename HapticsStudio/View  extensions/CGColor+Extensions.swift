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
    let clampedRatio = min(max(ratio, 0.0), 1.0) // Keep in the 0..1 range
    let ratioCompl = 1.0-clampedRatio
    let components = zip(minComponents, maxComponents)
        .map { CGFloat(ratioCompl * Double($0) + clampedRatio * Double($1)) }
    
    return CGColor(colorSpace: colorSpace, components: components) ?? minColor
}
