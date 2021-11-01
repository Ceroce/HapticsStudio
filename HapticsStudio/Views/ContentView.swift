//
//  ContentView.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: HapticsStudioDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(HapticsStudioDocument()))
    }
}
