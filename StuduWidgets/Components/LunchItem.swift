//
//  LunchItem.swift
//  studuwidgets
//
//  Created by Rostislav Brož on 4/9/22.
//

import SwiftUI

struct LunchItem: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 8.0) {
                Spacer()
                
                Text("Lunch Widget")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.linearGradient(colors: [.primary.opacity(0.7), .primary], startPoint: .bottomLeading, endPoint: .topTrailing))
                
                Text("StuduWidgets component")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                
                Text("Let's you know whatcha gonna eat today on your Home Screen")
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
                                    .hueRotation(Angle(degrees: model.lunchColor))
                                    .rotationEffect(Angle(degrees: model.timetableRotation))
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
                        .offset(y: -70)
                        .offset(x: proxy.frame(in: .global).minX / 2)
                )
                // If the image is overlapping: .padding(.vertical, 40)
        }
    }
}

struct LunchItem_Previews: PreviewProvider {
    static var previews: some View {
        LunchItem()
            .environmentObject(ContentModel())
    }
}
