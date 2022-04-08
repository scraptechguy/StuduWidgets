//
//  PreferenceKeys.swift
//  studuwidgets
//
//  Created by Rostislav Brož on 4/8/22.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
