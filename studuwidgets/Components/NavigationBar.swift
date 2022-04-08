//
//  NavigationBar.swift
//  studuwidgets
//
//  Created by Rostislav Brož on 4/8/22.
//

import SwiftUI

struct NavigationBar: View {
    @EnvironmentObject var model: ContentModel
    
    @Binding var hasScrolled: Bool
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .opacity(hasScrolled ? 1 : 0)
            
            Text("StuduWidgets")
                .animatableFont(size: hasScrolled ? 22 : 34, weight: .bold, design: .default)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20.0)
                .padding(.top, 20)
                .offset(y: hasScrolled ? -4 : 0)
            
            HStack {
                Button(action: {
                        //model.showingAccountView = true
                    }, label: {
                        Image(systemName: "person.circle")
                            .foregroundColor(.primary)
                            .font(.body.weight(.bold))
                            .frame(width: 30, height: 30)
                            .cornerRadius(10)
                            .padding(8)
                            .background(.ultraThinMaterial, in:
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                            )
                    })//.sheet(isPresented: $model.showingAccountView) {AccountView()}
            }.frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 20)
                .padding(.top, 20)
                .offset(y: hasScrolled ? -4 : 0)
        }.frame(height: hasScrolled ? 44 : 70)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(hasScrolled: .constant(false))
            .environmentObject(ContentModel())
    }
}
