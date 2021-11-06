//
//  DocumentView.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import SwiftUI

struct DocumentView: View {
    @Binding var document: HapticsDocument

    var body: some View {
        PatternView(pattern: $document.pattern, docEnv: $document.environment)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentView(document: .constant(HapticsDocument()))
    }
}
