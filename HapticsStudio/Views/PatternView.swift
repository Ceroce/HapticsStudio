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
        TimeRulerView(length: $pattern.length, zoom: $zoom)
    }
}

struct PatternView_Previews: PreviewProvider {
    static var previews: some View {
        PatternView(pattern: .constant(Pattern(tracks: [])), zoom: .constant(.init(pointsBySecond: 5000)))
    }
}
