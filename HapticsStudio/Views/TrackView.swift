//
//  TrackView.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import SwiftUI

struct TrackView: View {
    @Binding var track: Track
    @Binding var zoom: HapticsDocument.Zoom
    
    let eventWidth = CGFloat(20)
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Track.background"))
            Group {
                TrackGraduation(heightRatio: 0.75).stroke(lineWidth: 0.5)
                TrackGraduation(heightRatio: 0.50).stroke(lineWidth: 0.5)
                TrackGraduation(heightRatio: 0.25).stroke(lineWidth: 0.5)
            }
            .foregroundColor(Color("Track.graduation"))
            
            GeometryReader() { geometry in
                ForEach($track.events) { event in
                    TransientEventView(event: event, zoom: $zoom)
                        .frame(width: eventWidth, alignment: .bottomLeading)
                        .position(x: CGFloat((event.time).wrappedValue * zoom.pointsBySecond) + eventWidth/2, y: geometry.size.height/2.0)
                }
            }
        }
    }
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView(track: .constant(Track.sampleTrack), zoom: .constant(.init(pointsBySecond: 1000)))
            .previewLayout(.fixed(width: 1000, height: 100))
    }
}
