//
//  HomeView.swift
//  studuwidgets
//
//  Created by Rostislav Brož on 4/8/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    
    @State var hasScrolled: Bool = false
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                scrollDetection
                
                TabView {

                }.tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: 500)
                    .background(
                        Image("Blob2").offset(x: 10, y: -80)
                    )
                
                Text("What's new".uppercased())
                    .sectionTitleModifier()
                    .offset(y: -50)
                    .accessibilityAddTraits(.isHeader)
                
                WhatsNew()
                    .padding(.bottom)
            }.coordinateSpace(name: "scroll")
                .safeAreaInset(edge: .top, content: {
                    Color.clear.frame(height: 100)
                })
                .overlay(
                    NavigationBar(hasScrolled: $hasScrolled)
                )
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }.frame(height: 0)
            .onPreferenceChange(ScrollPreferenceKey.self) { value in
                withAnimation(.easeInOut) {
                    if value < 0 {
                        hasScrolled = true
                    } else {
                        hasScrolled = false
                    }
                }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .environmentObject(ContentModel())
            .previewInterfaceOrientation(.portrait)
    }
}
