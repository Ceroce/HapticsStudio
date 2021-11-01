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
        Rectangle()
            .fill(color(for: event.sharpness))
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
        TransientEventView(event: .constant(TransientEvent(time: 1.0, intensity: 1.0, sharpness: 0.0)), zoom: .constant(.init(pointsBySecond: 500)))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
        
        TransientEventView(event: .constant(TransientEvent(time: 1.0, intensity: 1.0, sharpness: 0.5)), zoom: .constant(.init(pointsBySecond: 500)))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
