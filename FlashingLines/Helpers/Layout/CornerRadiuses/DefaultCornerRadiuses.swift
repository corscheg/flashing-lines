//
//  DefaultCornerRadiuses.swift
//  28.10.2024
//

import Foundation

struct DefaultCornerRadiuses { }

// MARK: - CornerRadiuses
extension DefaultCornerRadiuses: CornerRadiuses {
    var small: CGFloat { 4 }
    var large: CGFloat { 20 }
}
