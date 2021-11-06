//
//  PatternView.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import SwiftUI

struct PatternView: View {
    @Binding var pattern: Pattern
    @Binding var zoom: HapticsDocument.Zoom
    
    @State private var startingPointsBySecond: Float?
    
    var body: some View {
        
        ScrollView([.horizontal, .vertical]) {
            VStack(spacing: 0) {
                ForEach($pattern.tracks) { track in
                    TrackHeaderView(track: track)
                        .frame(height: 20, alignment: .leading)
                    TrackView(track: track, zoom: $zoom)
                        .frame(height: 100, alignment: .leading)
                }
                
                TimeRulerView(length: $pattern.length, zoom: $zoom)
                    .frame(height: 40, alignment: .leading)
                
                Spacer()
            }
        }
        .gesture(
            MagnificationGesture()
                .onChanged { magnifyBy in
                    if startingPointsBySecond == nil {
                        startingPointsBySecond = zoom.pointsBySecond
                    }
                    print("magnifyBy = \(magnifyBy)")
                    zoom.pointsBySecond = startingPointsBySecond! * Float(magnifyBy)
                }
                .onEnded { magnifyBy in
                    startingPointsBySecond = nil
                }
        )
        
    }
}

struct PatternView_Previews: PreviewProvider {
    static var previews: some View {
        PatternView(pattern: .constant(Pattern.samplePattern), zoom: .constant(.init(pointsBySecond: 5000)))
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}
