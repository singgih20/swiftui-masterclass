//
//  HomeView.swift
//  Restart
//
//  Created by Singgih Aji Sasongko on 28/10/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        VStack {
            Text("Homeview!")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardingViewActive = true
            }, label: {
                Text("Restart")
            })
        } //: VStack
        
      
    }
}

#Preview {
    HomeView()
}
