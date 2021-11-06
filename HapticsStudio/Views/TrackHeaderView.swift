//
//  TrackHeaderView.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 06/11/2021.
//

import SwiftUI

struct TrackHeaderView: View {
    @Binding var track: Track
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("TrackHeader.background"))
            HStack {
                Text(track.title)
                    .font(.caption)
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        }
    }
}

struct TrackHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TrackHeaderView(track: .constant(Track.sampleTrack))
            .previewLayout(.fixed(width: 1000, height: 20.0))
    }
}
