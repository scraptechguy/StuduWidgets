//
//  TimetableSheet.swift
//  studuwidgets
//
//  Created by Rostislav Brož on 4/9/22.
//

import SwiftUI

struct TimetableSheet: View {
    @EnvironmentObject var model: ContentModel
    
    @State var notify: Bool = ContentModel().timetableNotify
    @State var color: Double = ContentModel().timetableColor
    @State var rotation: Double = ContentModel().timetableRotation
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    Section {
                        VStack {
                            HStack {
                                ForEach(model.monday, id: \.self) { subject in
                                    HStack {
                                        Text(subject)
                                            .font(.title3)
                                            .foregroundColor(Color("Font"))
                                    }.frame(maxWidth: .infinity)
                                }
                            }.padding(.horizontal)
                                .padding(.vertical, 3)
                            
                            Divider()
                            
                            HStack {
                                ForEach(model.tuesday, id: \.self) { subject in
                                    HStack {
                                        Text(subject)
                                            .font(.title3)
                                            .foregroundColor(Color("Font"))
                                    }.frame(maxWidth: .infinity)
                                }
                            }.padding(.horizontal)
                                .padding(.vertical, 3)
                            
                            Divider()
                            
                            HStack {
                                ForEach(model.wednesday, id: \.self) { subject in
                                    HStack {
                                        Text(subject)
                                            .font(.title3)
                                            .foregroundColor(Color("Font"))
                                    }.frame(maxWidth: .infinity)
                                }
                            }.padding(.horizontal)
                                .padding(.vertical, 3)
                            
                            Divider()
                            
                            HStack {
                                ForEach(model.thursday, id: \.self) { subject in
                                    HStack {
                                        Text(subject)
                                            .font(.title3)
                                            .foregroundColor(Color("Font"))
                                    }.frame(maxWidth: .infinity)
                                }
                            }.padding(.horizontal)
                                .padding(.vertical, 3)
                            
                            Divider()
                            
                            HStack {
                                ForEach(model.friday, id: \.self) { subject in
                                    HStack {
                                        Text(subject)
                                            .font(.title3)
                                            .foregroundColor(Color("Font"))
                                    }.frame(maxWidth: .infinity)
                                }
                            }.padding(.horizontal)
                                .padding(.vertical, 3)
                        }
                    }.background(
                        Image("Blob2")
                            .overlay(
                                .thinMaterial
                            )
                    )
                    .padding(.vertical)
                    
                    Section(footer: Text("Sends a notification each morning informing you about your day").foregroundColor(.secondary).lineLimit(3)) {
                        Toggle(isOn: $notify) {
                            Label("Notify each morning", systemImage: notify ? "checkmark.bubble.fill" : "checkmark.bubble")
                        }
                    }.foregroundColor(.primary)
                    
                    Section(header: Text("Customization")) {
                        ZStack {
                            Rectangle()
                                .fill(.thinMaterial)
                                .background(
                                    //Color(red: 1, green: value / 255, blue: 1)
                                    Image("Blob3")
                                        .rotationEffect(Angle(degrees: rotation))
                                        .scaleEffect(0.5)
                                )
                                .hueRotation(.degrees(color))
                            
                            VStack(spacing: 8.0) {
                                Text("Up next")
                                    .font(.title3.weight(.bold))
                                    .foregroundColor(.secondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(5)
                                    .padding(.leading, 10)
                                    .background(.ultraThinMaterial)
                                
                                Text("Ch")
                                    .font(.system(size: 55).weight(.bold))
                                    .foregroundColor(Color("Font"))
                                
                                
                                Text("Roušalová, 305")
                                    .font(.footnote)
                                    .foregroundColor(Color("Font"))
                                
                                Spacer()
                            }
                        }.frame(width: 150, height: 150)
                            .mask(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                            )
                            .padding(.vertical)
                            .padding(.bottom)
                        
                        HStack {
                            Text("Color")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                            Slider(value: $color, in: 0...180)
                                .padding(.horizontal)
                        }
                         
                        HStack {
                            Text("Rotation")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                            Slider(value: $rotation, in: 0...360)
                                .padding(.horizontal)
                        }
                        
                        Button(action: {
                                color = 0
                                rotation = 0
                            }, label: {
                                Text("Reset to defaults")
                                    .font(.footnote.weight(.bold))
                        })
                    }
                }.listStyle(.insetGrouped)
                    .navigationTitle("Timetable")
            }
            
            VStack {
                HStack() {
                    Button(action: {
                        model.showingTimetableSheet = false
                    }, label: {
                        Text("Cancel")
                            .font(.body)
                            .padding([.top, .leading], 20)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        model.showingTimetableSheet = false
                        
                        model.timetableNotify = notify
                        model.timetableColor = color
                        model.timetableRotation = rotation
                    }, label: {
                        Text("Save")
                            .font(.body.weight(.bold))
                            .padding([.top, .trailing], 20)
                    })
                }
                
                Spacer()
            }
        }
    }
}

struct TimetableSheet_Previews: PreviewProvider {
    static var previews: some View {
        TimetableSheet()
            .preferredColorScheme(.light)
            .environmentObject(ContentModel())
    }
}