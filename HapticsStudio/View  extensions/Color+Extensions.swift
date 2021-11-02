//
//  Color+Extensions.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import Foundation
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


