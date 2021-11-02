//
//  TrackGraduation.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import Foundation
import SwiftUI

struct TrackGraduation: Shape {
    /// Height of the line, from the bottom, expressed as a ratio of the containing view (0..1)
    let heightRatio: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let cgPath = CGMutablePath()
        let height = rect.maxY - heightRatio*rect.height
        cgPath.move(to: CGPoint(x: rect.minX, y: height))
        cgPath.addLine(to: CGPoint(x: rect.maxX, y: height))
        return Path(cgPath)
    }
}
