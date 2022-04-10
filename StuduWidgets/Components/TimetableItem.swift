//
//  TimetableItem.swift
//  studuwidgets
//
//  Created by Rostislav Brož on 4/9/22.
//

import SwiftUI

struct TimetableItem: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 8.0) {
                Spacer()
                
                Text("Timetable Widget")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.linearGradient(colors: [.primary.opacity(0.7), .primary], startPoint: .bottomLeading, endPoint: .topTrailing))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("StuduWidgets component")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Let's you view timetable on your Home Screen")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.secondary)
            }.padding(.all, 20.0)
                .frame(height: 350.0)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                .padding(.horizontal, 20.0)
                .rotation3DEffect(.degrees(proxy.frame(in: .global).minX / -10), axis: (x: 0, y: 1, z: 0))
                .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                .blur(radius: abs(proxy.frame(in: .global).minX / 40))
                .overlay(
                    ZStack {
                        Rectangle()
                            .fill(.thinMaterial)
                            .background(
                                //Color(red: 1, green: value / 255, blue: 1)
                                Image("Blob3")
                                    .rotationEffect(Angle(degrees: model.timetableRotation))
                                    .scaleEffect(0.5)
                            )
                            .hueRotation(.degrees(model.timetableColor))
                        
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
                                //.foregroundColor(Color("Font"))
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
                        .padding(.top)
                        .offset(y: -70)
                        .offset(x: proxy.frame(in: .global).minX / 2)
                )
        }
    }
}

struct TimetableItem_Previews: PreviewProvider {
    static var previews: some View {
        TimetableItem()
            .environmentObject(ContentModel())
    }
}
