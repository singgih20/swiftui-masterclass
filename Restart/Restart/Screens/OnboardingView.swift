//
//  OnboardingView.swift
//  Restart
//
//  Created by Singgih Aji Sasongko on 28/10/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding!")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardingViewActive = false
            }) {
                Text("Start")
            }
        } //VStack
            
    }
}

#Preview {
    OnboardingView()
}
