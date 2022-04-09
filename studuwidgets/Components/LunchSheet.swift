//
//  LunchSheet.swift
//  studuwidgets
//
//  Created by Rostislav Brož on 4/9/22.
//

import SwiftUI

struct LunchSheet: View {
    @EnvironmentObject var model: ContentModel
    
    @State var color: Double = ContentModel().lunchColor
    @State var rotation: Double = ContentModel().lunchRotation
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    Section {
                        Text("")
                    }.background(
                        Image("Blob2")
                            .overlay(
                                .thinMaterial
                            )
                    )
                    
                    Section {
                        Toggle(isOn: $model.lunchNotifyAlways) {
                            Label("Notify allways", systemImage: model.lunchNotifyAlways ? "checkmark.bubble.fill" : "checkmark.bubble")
                        }
                    }.foregroundColor(.primary)
                    
                    Section {
                        ZStack {
                            VStack(spacing: 8.0) {
                                Text("Monday")
                                    .font(.title3.weight(.bold))
                                    .foregroundColor(.secondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(5)
                                    .padding(.leading, 10)
                                    .background(.ultraThinMaterial)
                                
                                Spacer()
                            }.ignoresSafeArea()
                                .frame(maxWidth: .infinity)
                                .background(
                                    Image("Blob3")
                                        .scaleEffect(0.5)
                                        .overlay(
                                            Color.clear
                                                .background(.thinMaterial)
                                        )
                                        .hueRotation(Angle(degrees: color))
                                        .rotationEffect(Angle(degrees: rotation))
                                )
                            
                            Text("Kuřecí řízek s bramborovou kaší a zelným salátem")
                                .font(.footnote)
                                .foregroundColor(Color("Font"))
                                .lineLimit(3)
                                .multilineTextAlignment(.center)
                                .padding()
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
                }
            }
            
            VStack {
                HStack {
                    Button(action: {
                        model.showingLunchSheet = false
                    }, label: {
                        Text("Cancel")
                            .font(.body)
                            .padding([.top, .leading], 20)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        model.showingLunchSheet = false
                        
                        model.lunchColor = color
                        model.lunchRotation = rotation
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

struct LunchSheet_Previews: PreviewProvider {
    static var previews: some View {
        LunchSheet()
            .environmentObject(ContentModel())
    }
}
