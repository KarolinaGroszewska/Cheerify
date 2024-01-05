//
//  ContentView.swift
//  Cheerify
//
//  Created by Kari on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var affirmation: String = "Get started by pressing the refresh button..."
    var body: some View {
        NavigationStack() {
            ZStack{
                Color(red: 242/255, green: 237/255, blue: 228/255)
                    .ignoresSafeArea()
                VStack {
                    HStack{
                        NavigationLink {
                            MenuView()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .frame(width: 50, height: 50)
                                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                                .clipShape(Circle())
                                .font(.title)
                                .foregroundColor(Color.white)
                        }
                        .navigationDestination(for: String.self) { view in
                                if view == "MenuView" {
                                    MenuView()
                                }
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
                        NavigationLink {
                            AddView()
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
                    Text(affirmation)
                        .onAppear {
                            Task {
                                let (data, _) = try await URLSession.shared.data(from: URL(string: "https://www.affirmations.dev/")!)
                                let decodedResponse = try? JSONDecoder().decode(Affirmation.self, from: data)
                                affirmation = decodedResponse?.affirmation ?? "failed"
                            }
                        }
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    HStack{
                        Button {
                            Task {
                                let (data, _) = try await URLSession.shared.data(from: URL(string: "https://www.affirmations.dev/")!)
                                let decodedResponse = try? JSONDecoder().decode(Affirmation.self, from: data)
                                affirmation = decodedResponse?.affirmation ?? "failed"
                            }
                        } label: {
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
                            print("Favorite button")
                        } label: {
                            // favorite affirmation button
                            Image(systemName: "heart")
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
}

struct Affirmation: Codable {
    let affirmation: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
