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
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Track.background"))
        }
    }
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView(track: .constant(Track(events: [])), zoom: .constant(.init(pointsBySecond: 1000)))
            .previewLayout(.fixed(width: 1000, height: 100))
    }
}
