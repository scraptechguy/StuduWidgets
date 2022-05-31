//
//  ColorStylesView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 4/13/22.
//

import SwiftUI

struct ColorStylesView: View {
    @EnvironmentObject var model: ContentModel
    
    @State var color: Double = 0
    @State var rotation: Double = 0
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Saved colors").padding(.top, 30)) {
                    if model.savedColors == [""] {
                        Text("Your saved colors will appear here!")
                            .font(.body)
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(model.savedColors.indices, id: \.self) { i in
                            Button(action: {
                                    model.selected = i
                                }, label: {
                                    HStack {
                                        Image("Blob3")
                                            .resizable()
                                            .scaleEffect(2)
                                            .mask(Circle())
                                            .frame(width: 50, height: 15)
                                            .hueRotation(.degrees(Double(model.savedColors[i])!))
                                        
                                        Text(model.savedColors[i])
                                            .foregroundColor(.primary)
                                        
                                        Spacer()
                                        
                                        if model.selected == model.savedColors.firstIndex(of: model.savedColors[i]) {
                                            Image(systemName: "checkmark")
                                        }
                                    }
                            }).swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(action: {
                                        let index = model.savedColors.firstIndex(of: model.savedColors[i])
                                    
                                        model.savedColors.remove(at: index!)
                                    }, label: {
                                        Label("Delete item", systemImage: "trash")
                                            .foregroundColor(.red)
                                })
                            }
                        }
                    }
                }
                
                Section(header: Text("Create styles"), footer: Text("").lineLimit(2)) {
                    HStack {
                        Spacer()
                        
                        Rectangle()
                            .fill(.thinMaterial)
                            .background(
                                //Color(red: 1, green: value / 255, blue: 1)
                                Image("Blob3")
                                    .rotationEffect(Angle(degrees: rotation))
                                    .scaleEffect(0.5)
                            )
                            .hueRotation(.degrees(color))
                            .frame(width: 150, height: 150)
                            .mask(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                            )
                            .padding(.vertical)
                            .padding(.top)
                    
                        Spacer()
                    }
                
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
                                    model.savedColors.append(String(Int(color)))
                                }
                            }, label: {
                                Text("Save style")
                                    .font(.footnote.weight(.bold))
                        })
                        
                        Spacer()
                    }.padding(.vertical)
                }
            }.listStyle(.insetGrouped)
                .ignoresSafeArea()
                .navigationBarHidden(true)
        }
    }
}

struct ColorStylesView_Previews: PreviewProvider {
    static var previews: some View {
        ColorStylesView()
            .preferredColorScheme(.dark)
            .environmentObject(ContentModel())
    }
}
