//
//  CardView.swift
//  Hike
//
//  Created by Singgih Aji Sasongko on 23/10/24.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
    
        imageNumber = randomNumber
    }
    var body: some View {
        ZStack {
        
            CustomBackgroundView()
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(
                                colors: [
                                    .customGrayLight,
                                    .customGrayMedium
                            ], startPoint: .top, endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button {
                            print("KOcak")
                        } label: {
                            CustomButtonView()
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                // MARK: - MAIN CONTENT
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                            colors: [
                                Color("ColorIndigoMedium"),
                                Color("ColorSalmonLight")
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 256, height: 256)
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                    
                }
                // MARK: - FOOTER
                Button {
                    print("Explore more")
                    randomImage()
                } label: {
                    Text("Explore more")
                        .fontWeight(.heavy)
                        .font(.title2)
                        .foregroundStyle(LinearGradient(
                            colors: [.colorGreenLight, .colorGreenMedium],
                            startPoint: .top,
                            endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
