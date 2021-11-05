//
//  TransientEventView.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import SwiftUI

struct TransientEventView: View {
    @Binding var event: TransientEvent
    @Binding var zoom: HapticsDocument.Zoom
    
    /// Not the actual length, but the length used to represent the event.
    let representationLength: HapticTime = 0.02
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color(red: 0, green: 0, blue: 0, opacity: 0.05))
                Rectangle()
                    .fill(color(for: event.sharpness))
                    .frame(height: CGFloat(event.intensity) * geometry.size.height, alignment: .bottomLeading)
            }
            
        }
    }
    
    private func color(for sharpness: HapticSharpness) -> Color {
        guard let minColor = UIColor(named: "Event.minSharpness"),
              let maxColor = UIColor(named: "Event.maxSharpness") else {
                  return .black
              }

        return Color(mix(minColor.cgColor, maxColor.cgColor, ratio: CGFloat(sharpness)))
    }
}

struct TransientEventView_Previews: PreviewProvider {
    static var previews: some View {
        TransientEventView(event: .constant(TransientEvent(time: 1.0, intensity: 0.25, sharpness: 0.0)), zoom: .constant(.init(pointsBySecond: 500)))
            .previewLayout(.fixed(width: 20, height: 100.0))
        
        TransientEventView(event: .constant(TransientEvent(time: 1.0, intensity: 1.0, sharpness: 0.5)), zoom: .constant(.init(pointsBySecond: 500)))
            .previewLayout(.fixed(width: 20, height: 100.0))
    }
}
