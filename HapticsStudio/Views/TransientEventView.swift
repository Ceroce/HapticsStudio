//
//  TransientEventView.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import SwiftUI

struct TransientEventView: View {
    @Binding var event: TransientEvent
    var body: some View {
        Rectangle()
    }
}

struct TransientEventView_Previews: PreviewProvider {
    static var previews: some View {
        TransientEventView(event: .constant(TransientEvent(time: 1.0, intensity: 1.0, sharpness: 0.5)))
    }
}
