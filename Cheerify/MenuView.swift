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
                .frame(width: 45, height: 45)
                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                .clipShape(Circle())
                .font(.title3)
                .foregroundColor(Color.white)
                .padding(.leading, 10)
        }
    }
    var body: some View {
        ZStack{
            Color(red: 242/255, green: 237/255, blue: 228/255)
                .ignoresSafeArea()
            VStack{
                HStack{
                    backButton
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
                    NavigationLink {
                        FavoritesView()
                    } label: {
                        // favorite affirmation button
                        Image(systemName: "heart")
                            .frame(width: 45, height: 45)
                            .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                            .clipShape(Circle())
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .padding(.trailing, 10)
                }
                Spacer()
                NavigationLink {
                    ContentView()
                } label: {
                    Image(systemName: "house")
                    Text("All Affirmations")
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                NavigationLink {
                    FavoritesView()
                } label: {
                    Image(systemName: "heart")
                    Text("Favorite Affirmations")
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                NavigationLink {
                    CustomView()
                } label: {
                    Image(systemName: "pencil")
                    Text("Custom Affirmations")
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }

}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
