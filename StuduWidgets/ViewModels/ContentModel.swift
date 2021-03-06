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
    @AppStorage("timetableNotify") var timetableNotify = false
    @AppStorage("lunchNotify") var lunchNotify = false
    @Published var showingAccountView: Bool = false
    @Published var showingTimetableSheet: Bool = false
    @Published var showingLunchSheet: Bool = false
    
    @Published var savedColors: [String] = ["42", "124", "180"]
    @Published var isFluent: Bool = true
    @Published var selected: Int = 0
    
    
    // MARK: App Storage vars
    
    @AppStorage("appColor") var appColor: Double = 0
    
    @AppStorage("timetableColor") var timetableColor: Double = 0
    @AppStorage("timetableRotation") var timetableRotation: Double = 180
    
    @AppStorage("lunchColor") var lunchColor: Double = 0
    @AppStorage("lunchRotation") var lunchRotation: Double = 180
    
    
    // MARK: Timetable 
    
    @Published var monday: [String] = ["Etv", "Etv", "M", "Nj", "Aj", "Cj"]
    @Published var tuesday: [String] = ["M", "F", "Ch", "Cj", "Aj", "D", "Tv"]
    @Published var wednesday: [String] = ["F", "Nj", "M", "Cj", "Zsv", "Bi", "Z"]
    @Published var thursday: [String] = ["Tv", "Ivt", "Ivt", "Aj", "Aj", "Z", "Ch"]
    @Published var friday: [String] = ["Bi", "D", "Zsv", "M", "Cj", "Nj"]
    
    // MARK: Lunches
    
    @Published var days: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri"]
    @Published var lunches: [String] = ["Pečené kuřecí stehno a la bažant, rýže dlouhozrnná", "Dukátové buchtičky se šodó", "Sekaná pečeně se svíčkovou omáčkou, houskový knedlík", "Milánské špagety sypané sýrem", "Francouzské brambory s uzenou rolkou, zelný salát s mrkví"]
}
