//
//  Int+RelativeDate.swift
//  Feeder
//
//  Created by Nick Goncharenko on 09.01.2026.
//

import Foundation

extension Int {
    var toRelativeDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}
