//
//  TimeRulerView.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import SwiftUI

struct TimeRulerView: View {
    @Binding var length: HapticTime
    @Binding var zoom: HapticsDocument.Zoom
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("TimeRuler.background"))
                .frame(width: CGFloat(zoom.pointsBySecond*length), alignment: .leading)
            Text("0,1")
        }
    }
}

struct TimeRulerView_Previews: PreviewProvider {
    static var previews: some View {
        TimeRulerView(length: .constant(2.0), zoom: .constant(.init(pointsBySecond: 1000.0)))
            .previewLayout(.fixed(width: 2500, height: 50))
    }
}
