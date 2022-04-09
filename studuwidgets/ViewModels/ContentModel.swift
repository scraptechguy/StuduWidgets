//
//  ContentModel.swift
//  studuwidgets
//
//  Created by Rostislav Brož on 4/8/22.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    // MARK: State vars
    
    @AppStorage("isLiteMode") var isLiteMode = true
    @AppStorage("notifyAlways") var timetableNotifyAlways = false
    @AppStorage("notifyAlways") var lunchNotifyAlways = false
    @Published var showingAccountView: Bool = false
    @Published var showingTimetableSheet: Bool = false
    @Published var showingLunchSheet: Bool = false
    
    @AppStorage("timetableColor") var timetableColor: Double = 0
    @AppStorage("timetableRotation") var timetableRotation: Double = 180
    
    @AppStorage("lunchColor") var lunchColor: Double = 0
    @AppStorage("lunchRotation") var lunchRotation: Double = 180
    
    @Published var monday: [String] = ["M", "F", "Ch", "Cj", "Aj", "D", "Tv"]
    @Published var tuesday: [String] = ["M", "F", "Ch", "Cj", "Aj", "D", "Tv"]
    @Published var wednesday: [String] = ["M", "F", "Ch", "Cj", "Aj", "D", "Tv"]
    @Published var thursday: [String] = ["M", "F", "Ch", "Cj", "Aj", "D", "Tv"]
    @Published var friday: [String] = ["M", "F", "Ch", "Cj", "Aj", "D", "Tv"]
}
