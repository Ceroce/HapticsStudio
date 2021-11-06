//
//  PatternView.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import SwiftUI

struct PatternView: View {
    @Binding var pattern: Pattern
    @Binding var docEnv: HapticsDocument.Environment
    
    /// The zoom at the begining of the Magnification gesture
    @State private var startingZoom: HapticsDocument.Environment.PointsBySecond?
    
    var body: some View {
        
        ScrollView([.horizontal, .vertical]) {
            VStack(spacing: 0) {
                ForEach($pattern.tracks) { track in
                    TrackHeaderView(track: track)
                        .frame(height: 20, alignment: .leading)
                    TrackView(track: track, docEnv: $docEnv)
                        .frame(height: 100, alignment: .leading)
                }
                
                TimeRulerView(length: $pattern.length, docEnv: $docEnv)
                    .frame(height: 40, alignment: .leading)
                
                Spacer()
            }
        }
        .gesture(
            MagnificationGesture()
                .onChanged { magnifyBy in
                    if startingZoom == nil {
                        startingZoom = docEnv.zoom
                    }
                    // magnifyBy is expressed as a ratio (0..1) of the size at the beginning of the gesture
                    docEnv.zoom = startingZoom! * Float(magnifyBy)
                }
                .onEnded { magnifyBy in
                    startingZoom = nil
                }
        )
        
    }
}

struct PatternView_Previews: PreviewProvider {
    static var previews: some View {
        PatternView(pattern: .constant(Pattern.samplePattern), docEnv: .constant(.init(zoom: 5000)))
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}
