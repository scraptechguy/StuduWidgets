//
//  LunchSheet.swift
//  studuwidgets
//
//  Created by Rostislav Brož on 4/9/22.
//

import SwiftUI

struct LunchSheet: View {
    @EnvironmentObject var model: ContentModel
    
    @State var notify: Bool = ContentModel().lunchNotify
    @State var color: Double = ContentModel().lunchColor
    @State var rotation: Double = ContentModel().lunchRotation
    @State var message: String = "Lunch data are up to date!"
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    Section(footer: Text(message)) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            VStack(spacing: 18.0) {
                                HStack {
                                    Text("Mon")
                                        .foregroundColor(Color("Font"))
                                        .frame(width: 50)
                                    
                                    Divider()
                                    
                                    Text("Kuřecí řízek s bramborovou kaší a zelným salátem")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                }
                                
                                HStack {
                                    Text("Tue")
                                        .foregroundColor(Color("Font"))
                                        .frame(width: 50)
                                    
                                    Divider()
                                    
                                    Text("Kuřecí řízek s bramborovou kaší a zelným salátem")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                }
                                
                                HStack {
                                    Text("Wed")
                                        .foregroundColor(Color("Font"))
                                        .frame(width: 50)
                                    
                                    Divider()
                                    
                                    Text("Kuřecí řízek s bramborovou kaší a zelným salátem")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                }
                                
                                HStack {
                                    Text("Thu")
                                        .foregroundColor(Color("Font"))
                                        .frame(width: 50)
                                    
                                    Divider()
                                    
                                    Text("Kuřecí řízek s bramborovou kaší a zelným salátem")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                }
                                
                                HStack {
                                    Text("Fri")
                                        .foregroundColor(Color("Font"))
                                        .frame(width: 50)
                                    
                                    Divider()
                                    
                                    Text("Kuřecí řízek s bramborovou kaší a zelným salátem")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                }
                            }
                        }.background(
                            Image("Blob2")
                                .overlay(
                                    .thinMaterial
                                )
                        )
                        .padding(.vertical)
                    }
                    
                    Section(footer: Text("Sends a notification each morning informing you about your day").foregroundColor(.secondary).lineLimit(3)) {
                        Toggle(isOn: $notify) {
                            Label("Notify each morning", systemImage: notify ? "checkmark.bubble.fill" : "checkmark.bubble")
                        }
                    }.foregroundColor(.primary)
                    
                    Section(header: Text("Customization")) {
                        HStack {
                            Spacer()
                            
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
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("Color")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                            Slider(value: $color, in: 0...180)
                                .padding(.horizontal)
                        }.listRowSeparator(.hidden)
                         
                        HStack {
                            Text("Rotation")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                            Slider(value: $rotation, in: 0...360)
                                .padding(.horizontal)
                        }.listRowSeparator(.hidden)
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                    color = 0
                                    rotation = 0
                                }, label: {
                                    Text("Reset to defaults")
                                        .font(.footnote.weight(.bold))
                            })
                            
                            Spacer()
                        }.padding(.vertical)
                    }
                }.listStyle(.insetGrouped)
                    .navigationTitle("Lunches")
                    .refreshable {
                        fakeUpdate()
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
                        
                        model.lunchNotify = notify
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
    
    func fakeUpdate() {
        message = "Updating..."
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            message = "Lunch data are up to date!"
        }
    }
}

struct LunchSheet_Previews: PreviewProvider {
    static var previews: some View {
        LunchSheet()
            .environmentObject(ContentModel())
    }
}
