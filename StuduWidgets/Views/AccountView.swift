//
//  AccountView.swift
//  studuwidgets
//
//  Created by Rostislav Brož on 4/8/22.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    Section {
                        Menu {
                            Button(action: {
                                    
                                }, label: {
                                    Label("Delete", systemImage: "trash")
                                        .foregroundColor(.red)
                            })
                        } label: {
                            HStack {
                                Group {
                                    VStack {
                                        Text("Rostislav Troníček")
                                            .font(.title2.weight(.semibold))
                                            .foregroundColor(.primary)
                                            .lineLimit(1)
                                            .padding(.horizontal, 10)
                                            .frame(maxWidth: .infinity)
                                        
                                        Text("Bakaláři.cz")
                                            .font(.footnote)
                                            .foregroundColor(.secondary)
                                            .frame(maxWidth: .infinity)
                                    }
                                }.frame(maxWidth: .infinity, alignment: .leading)
                                
                                Image(systemName: "person.crop.circle.fill.badge.checkmark")
                                    .symbolVariant(.circle.fill)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(Color("AccentColor"), Color("AccentColor"))
                                    .padding()
                                    .background(Circle().fill(.ultraThinMaterial))
                            }.frame(maxWidth: .infinity)
                                .background(
                                    AnimatedBlobView()
                                        .frame(width: 400, height: 414)
                                        .offset(x: 200, y: 0)
                                        .scaleEffect(1)
                                        .hueRotation(.degrees(model.appColor))
                                )
                                .padding()
                        }
                        
                        NavigationLink(destination: WhatsNew()) {
                            Text("Add account")
                        }
                    }
                    
                    Section(header: Text("App accent color")) {
                        HStack {
                            Image("Blob3")
                                .resizable()
                                .frame(width: 30, height: 20)
                                .hueRotation(.degrees(model.appColor))
                            
                            Slider(value: $model.appColor, in: 0...180)
                                .padding(.horizontal)
                        }
                        
                        NavigationLink(destination: ColorStylesView()) {
                            Text("Choose from styles")
                        }
                    }
                    
                    Section(header: Text("Information").foregroundColor(.secondary)) {
                        NavigationLink(destination: WhatsNew()) {
                            Label("Feedback", systemImage: "person")
                        }
                        
                        NavigationLink(destination: WhatsNew()) {
                            Label("How does it work?", systemImage: "lightbulb")
                        }
                        
                        NavigationLink(destination: WhatsNew()) {
                            Label("Help", systemImage: "questionmark")
                        }
                    }.foregroundColor(.primary)
                    
                    Section(header: Text("Links")) {
                        Link(destination: URL(string: "https://youtu.be/dQw4w9WgXcQ")!) {
                            HStack {
                                Label("Website", systemImage: "sun.min")
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: "link")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                        }.swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(action: {
                                    UIPasteboard.general.string = "https://youtu.be/dQw4w9WgXcQ"
                                }, label: {
                                    Label("Copy to clipboard", systemImage: "rectangle.on.rectangle")
                            })
                        }
                        
                        Link(destination: URL(string: "https://github.com/filiptronicek/StuduWidgets")!) {
                            HStack {
                                Label("Github", systemImage: "cloud")
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: "link")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                        }.swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(action: {
                                    UIPasteboard.general.string = "https://github.com/filiptronicek/StuduWidgets"
                                }, label: {
                                    Label("Copy to clipboard", systemImage: "rectangle.on.rectangle")
                            })
                        }
                    }
                    
                    Section {
                        Label("Version 1.0", systemImage: "server.rack")
                            .background(
                                Image("Blob2")
                                    .hueRotation(.degrees(model.appColor))
                            )
                        
                        Text("Made with Ɛ> by Fífa and Rosťa")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }.foregroundColor(.secondary)
                }.listStyle(.insetGrouped)
                    .navigationTitle("Account")
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        model.showingAccountView = false
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(.ultraThinMaterial)
                            
                            Image(systemName: "multiply")
                                .font(.title3)
                                .foregroundColor(.secondary)
                        }.frame(width: 35, height: 35)
                            .padding(.trailing)
                            .padding(.top, 12)
                    })
                }
                
                Spacer()
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .preferredColorScheme(.dark)
            .environmentObject(ContentModel())
    }
}

