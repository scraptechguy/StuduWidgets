//
//  Styles.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 4/13/22.
//

import SwiftUI

struct Styles: View {
    @EnvironmentObject var model: ContentModel
    
    @State var color: Double = 0
    @State var rotation: Double = 0
    @State var message: String = ""
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    Section(header: Text("Saved colors")) {
                        if model.savedColors == [""] {
                            Text("Your saved colors will appear here!")
                                .font(.body)
                                .foregroundColor(.secondary)
                        } else {
                            ForEach(model.savedColors, id: \.self) { item in
                                HStack {
                                    Image("Blob2")
                                        .resizable()
                                        .scaleEffect(2)
                                        .mask(Circle())
                                        .frame(width: 50, height: 15)
                                        .hueRotation(.degrees(Double(item)!))
                                    
                                    Text(item)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("Create")) {
                        Text("")
                            .frame(maxWidth: .infinity)
                            .background(
                                Image("Blob3")
                                    .scaleEffect(2)
                                    .overlay(.ultraThinMaterial)
                                    .rotationEffect(Angle(degrees: rotation))
                                    .hueRotation(.degrees(color))
                            )
                    }
                    
                    Section(footer: Text(message).lineLimit(2)) {
                        HStack {
                            Text("Color")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .frame(width: 60)
                            
                            Slider(value: $color, in: 0...180)
                                .padding(.horizontal)
                        }.listRowSeparator(.hidden)
                            .padding(.top)
                         
                        HStack {
                            Text("Rotation")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .frame(width: 60)
                            
                            Slider(value: $rotation, in: 0...360)
                                .padding(.horizontal)
                        }.listRowSeparator(.hidden)
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                    withAnimation {
                                        model.savedColors.append(String(color))
                                        color = 0
                                        rotation = 0
                                    }
                                }, label: {
                                    Text("Save style")
                                        .font(.footnote.weight(.bold))
                            })
                            
                            Spacer()
                        }.padding(.vertical)
                    }
                }.listStyle(.insetGrouped)
                    .navigationTitle("Styles")
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        model.showingLunchSheet = false
                    }, label: {
                        Text("Okay")
                            .font(.body.weight(.bold))
                            .padding([.top, .trailing], 20)
                    })
                }
                
                Spacer()
            }
        }
    }
}

struct Styles_Previews: PreviewProvider {
    static var previews: some View {
        Styles()
            .environmentObject(ContentModel())
    }
}
