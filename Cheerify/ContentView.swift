//
//  ContentView.swift
//  Cheerify
//
//  Created by Kari on 1/5/24.
//

import SwiftUI

// TODO: fix the padding for menu and title

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 242/255, green: 237/255, blue: 228/255)
                .ignoresSafeArea()
            VStack {
                HStack{
                    Button {
                        //view menu button
                        print("Button")
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .frame(width: 50, height: 50)
                            .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                            .clipShape(Circle())
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .padding(.leading, 10)
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
                    Button {
                        //add affirmation button
                        print("Button")
                    } label: {
                        Image(systemName: "plus")
                            .frame(width: 50, height: 50)
                            .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                            .clipShape(Circle())
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .padding(.trailing, 10)

                    
                }
                Spacer()
                Text("This is my affirmation, yay!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                    .multilineTextAlignment(.center)
                Spacer()
                HStack{
                    Button {
                        print("Button")
                    } label: {
                        // refresh affirmation button
                        Image(systemName: "arrow.clockwise")
                            .frame(width: 50, height: 50)
                            .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                            .clipShape(Circle())
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .padding(.leading, 10)
                    Spacer()
                    Button {
                        print("Button")
                    } label: {
                        // favorite affirmation button
                        Image(systemName: "heart.fill")
                            .frame(width: 50, height: 50)
                            .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                            .clipShape(Circle())
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .padding(.trailing, 10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// HStack {}
