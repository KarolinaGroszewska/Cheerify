//
//  MenuView.swift
//  Cheerify
//
//  Created by Kari on 1/5/24.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "house")
                .frame(width: 50, height: 50)
                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                .clipShape(Circle())
                .font(.title3)
                .foregroundColor(Color.white)
                .padding(.top, 10)
        }
    }
    var body: some View {
        ZStack{
            Color(red: 242/255, green: 237/255, blue: 228/255)
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }

}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
