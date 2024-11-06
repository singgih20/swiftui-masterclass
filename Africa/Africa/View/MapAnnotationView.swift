//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Singgih Aji Sasongko on 06/11/24.
//

import SwiftUI

struct MapAnnotationView: View {
    var location: NationalParkLocation
    
    @State private var animation: Double = 0.0
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 54, height: 54, alignment: .center)
                .scaleEffect(1 + animation)
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
       
        
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    
    static var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
