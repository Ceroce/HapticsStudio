//
//  Logger+Extensions.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 03/11/2021.
//

import Foundation
import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let general = Logger(subsystem: subsystem, category: "general")
    static let ui = Logger(subsystem: subsystem, category: "ui")
    static let resources = Logger(subsystem: subsystem, category: "resources")
}
