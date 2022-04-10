//
//  LoginView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 4/10/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text("Log in")
                .font(.largeTitle.weight(.bold))
                
            Text("Bla bla bla")
                .font(.headline)
            
            Button(action: {}, label: {
                Text("Log in")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }).background(.thinMaterial)
     
        }.padding(.all, 20.0)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            )
            .background(
                Image("Blob3")
                    .scaleEffect(1)
            )
            .padding(.all, 20.0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
