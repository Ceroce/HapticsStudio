//
//  Color+Extensions.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import Foundation
import CoreGraphics
import SwiftUI

/// Linear interpolation between two Color's.
///
/// THIS METHOD DOES NOT WORK WITH ASSETS BECAUSE YOU CANNOT GET THE CGCOLOR FOR A SO-CALLED DYNAMIC COLOR.
func mix(_ minColor: Color, _ maxColor: Color, ratio: CGFloat) -> Color {
    guard let leftCGColor = minColor.cgColor,
          let rightCGColor = maxColor.cgColor else {
              NSLog("Could not get CGColors from SwiftUI Colors")
              return minColor
          }
    return Color(mix(leftCGColor, rightCGColor, ratio: ratio))
}

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
