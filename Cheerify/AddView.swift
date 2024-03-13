//
//  AddView.swift
//  Cheerify
//
//  Created by Kari on 1/5/24.
//

import CoreML
import SwiftUI

struct AddView: View {
    @State private var showAlert = false
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
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var favorite = false
    @State var newAffirmation = ""
    @State var categoryMessage = ""
    @State private var showPopUp = false
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
                    Button {
                        //TODO: fix the heart toggle
                        favorite.toggle()
                    } label: {
                        Image(systemName: favorite ? "heart.fill" : "heart")
                            .frame(width: 45, height: 45)
                            .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                            .clipShape(Circle())
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .padding(.trailing, 10)
                }
                Spacer()
                TextField("Enter your new affirmation...", text: $newAffirmation, axis: .vertical)
                  .multilineTextAlignment(.center)
                  .font(.title2)
                  .fontWeight(.bold)
                  .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                  .padding()
                  .lineLimit(3, reservesSpace: true)

                Button {
                    let favAffirmation = Entity(context: managedObjectContext)
                    favAffirmation.text = newAffirmation
                    favAffirmation.isFavorite = favorite
                    favAffirmation.isCustom = true
                    PersistenceController.shared.save()
                    showPopUp = true
                } label: {
                    Image(systemName: "plus")
                    Text("Save Affirmation")
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .sheet(isPresented: $showPopUp) {
                    PopUpView(isShowing: $showPopUp)
                        .presentationDetents([.height(300)])
                        .presentationCornerRadius(70)
                }
                
                Button {
                    determineCategory()
                } label: {
                    Image(systemName: "pencil")
                    Text("Determine Category")
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color(red: 196/255, green: 197/255, blue: 202/255))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                Text(categoryMessage.isEmpty ? "" : "Saving affirmation under \(categoryMessage) category")
                    .font(.subheadline)
                    .foregroundColor(Color(red: 63/255, green: 65/255, blue: 78/255))
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    func determineCategory() {
        do {
            let config = MLModelConfiguration()
            let model = try CheerifyAffirmationClassifier(configuration: config)
            let prediction = try model.prediction(text: newAffirmation)
            categoryMessage = prediction.label
        } catch {
            categoryMessage = "unknown"
        }
    }
}

struct PopUpView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Affirmation Saved")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
                Text("Your affirmation has been saved.")
                    .foregroundColor(.white)
                    .padding()
                
                Button(action: {
                    withAnimation {
                        self.isShowing = false
                    }
                }) {
                    Text("OK")
                        .frame(width: 100)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                        
                       
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.gray)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
            )
            .padding()
            
        }
    }
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
