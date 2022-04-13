//
//  WhatsNew.swift
//  studuwidgets
//
//  Created by Rostislav Brož on 4/8/22.
//

import SwiftUI

struct WhatsNew: View {
    @EnvironmentObject var model: ContentModel
    
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Customizable Widgets")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.linearGradient(colors: [.primary.opacity(0.7), .primary], startPoint: .bottomLeading, endPoint: .topTrailing))
                        .matchedGeometryEffect(id: "title", in: namespace)
                    
                    Text("Customizable widgets are here!")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                        .matchedGeometryEffect(id: "caption", in: namespace)
                    
                    Text("Bla bla bla Bla bla bla lůakjaůlsdkjfaůslkjfaůslkjfasůlkfjasůdlkfjasůlkjfaůlskjfaůslkfjůaslkfjůaslkjfůaslkjfůalsdkjfaůlskdjfůalskdjfůalskjfůasldkjfaůlskjfůalskjdfůalskjdfůalskjdfůaslkdjfůasljfůlaskdjfůlsakjdfůlaskdjfůalskdjfůalskdjfůslkdjfůaslkjfdůaslkdfjasůlkfjůalsdfjůalsdkjfůlasdkjfůlsadkjfůlasdkjfůlaskdjfůlsadkjfůlaskjfůlsdjklfůkj")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.secondary)
                        .matchedGeometryEffect(id: "body", in: namespace)
                    
                    Spacer()
                }.padding(.all, 20.0)
                    .frame(height: 350.0)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .matchedGeometryEffect(id: "backgroundMatrial", in: namespace)
                    )
                    .padding(.horizontal, 20.0)
                    .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                    .background(
                        Image("Blob3")
                            .hueRotation(.degrees(model.appColor))
                            .matchedGeometryEffect(id: "background", in: namespace)
                            .offset(x: -20, y: -60)
                    )
                    .overlay(
                        Image("Blob2")
                            .resizable()
                            .frame(width: 200, height: 180)
                            .hueRotation(.degrees(model.appColor))
                            .matchedGeometryEffect(id: "overlay", in: namespace)
                            .offset(y: 65)
                    )
                    .matchedGeometryEffect(id: "vstack", in: namespace)
            } else {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Spacer()
                        
                        Text("Customizable Widgets")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.linearGradient(colors: [.primary.opacity(0.7), .primary], startPoint: .bottomLeading, endPoint: .topTrailing))
                            .matchedGeometryEffect(id: "title", in: namespace)
                        
                        Text("Customizable widgets are here!")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                            .matchedGeometryEffect(id: "caption", in: namespace)
                        
                        Text("Bla bla bla Bla bla bla lůakjaůlsdkjfaůslkjfaůslkjfasůlkfjasůdlkfjasůlkjfaůlskjfaůslkfjůaslkfjůaslkjfůaslkjfůalsdkjfaůlskdjfůalskdjfůalskjfůasldkjfaůlskjfůalskjdfůalskjdfůalskjdfůaslkdjfůasljfůlaskdjfůlsakjdfůlaskdjfůalskdjfůalskdjfůslkdjfůaslkjfdůaslkdfjasůlkfjůalsdfjůalsdkjfůlasdkjfůlsadkjfůlasdkjfůlaskdjfůlsadkjfůlaskjfůlsdjklfůkj")
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.secondary)
                            .matchedGeometryEffect(id: "body", in: namespace)
                    }.ignoresSafeArea()
                        .padding(.all, 20.0)
                        .frame(height: 500.0)
                        .background(
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .matchedGeometryEffect(id: "backgroundMatrial", in: namespace)
                        )
                        .padding(.horizontal, 20.0)
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .overlay(
                            Image("Blob2")
                                .resizable()
                                .frame(width: 200, height: 180)
                                .hueRotation(.degrees(model.appColor))
                                .matchedGeometryEffect(id: "overlay", in: namespace)
                                .offset(y: -150)
                        )
                        .matchedGeometryEffect(id: "vstack", in: namespace)
                }.background(
                    Image("Blob3")
                        .hueRotation(.degrees(model.appColor))
                        .matchedGeometryEffect(id: "background", in: namespace)
                        .offset(x: -20, y: -60)
                )
            }
        }.onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}

struct WhatsNew_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNew()
    }
}
