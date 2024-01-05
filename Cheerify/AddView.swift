//
//  AddView.swift
//  Cheerify
//
//  Created by Kari on 1/5/24.
//

import SwiftUI

struct AddView: View {
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
        @State var newAffirmation = ""
        ZStack{
            Color(red: 242/255, green: 237/255, blue: 228/255)
                .ignoresSafeArea()
            VStack{
                HStack{
                    backButton
                        .padding(.leading, 10)
                        .padding(.trailing, -60)
                    Spacer()
                    VStack {
                        Text("Cheerify")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                        Text("daily affirmation companion")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                    }
                    Spacer()
                }
                Spacer()
//                TextField("Enter your new affirmation...", text: $newAffirmation)
//                  .multilineTextAlignment(.center)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
