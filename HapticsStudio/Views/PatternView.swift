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
    
    var body: some View {
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
}

struct PatternView_Previews: PreviewProvider {
    static var previews: some View {
        PatternView(pattern: .constant(Pattern.samplePattern), zoom: .constant(.init(pointsBySecond: 5000)))
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}
