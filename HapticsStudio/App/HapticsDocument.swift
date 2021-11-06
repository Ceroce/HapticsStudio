//
//  HapticsDocument.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 01/11/2021.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var appleHaptics: UTType {
        UTType(importedAs: "com.apple.ahap")
    }
}

struct HapticsDocument: FileDocument {
    var pattern: Pattern

    struct Zoom {
        var pointsBySecond: Float = 1000.0
    }
    var zoom: Zoom = .init()
    
    init() {
        self.pattern = Pattern(tracks: [])
    }

    static var readableContentTypes: [UTType] { [.appleHaptics] }

#warning("Not implemented yet")
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let text = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        
        // HERE: parse the JSON and make a Pattern from it
        pattern = Pattern.samplePattern
    }
    
#warning("Not implemented yet")
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        // HERE: turn the Pattern to JSON

        let data = Data()
        return .init(regularFileWithContents: data)
    }
}
