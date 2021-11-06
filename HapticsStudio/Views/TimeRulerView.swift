//
//  TimeRulerView.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import SwiftUI

struct TimeRulerView: View {
    @Binding var length: HapticTime
    @Binding var docEnv: HapticsDocument.Environment
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("TimeRuler.background"))
                .frame(width: CGFloat(docEnv.zoom*length), alignment: .leading)
            Text("0,1")
        }
    }
}

struct TimeRulerView_Previews: PreviewProvider {
    static var previews: some View {
        TimeRulerView(length: .constant(2.0), docEnv: .constant(.init(zoom: 1000.0)))
            .previewLayout(.fixed(width: 2500, height: 50))
    }
}
