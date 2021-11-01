//
//  HapticsStudioApp.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import SwiftUI

@main
struct HapticsStudioApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: HapticsDocument()) { file in
            DocumentView(document: file.$document)
        }
    }
}
