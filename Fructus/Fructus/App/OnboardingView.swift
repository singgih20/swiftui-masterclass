//
//  OnboardingView.swift
//  Fructus
//
//  Created by Singgih Aji Sasongko on 03/11/24.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(0..<5) { item in
                FruitCardView()
                FruitCardView()
            }
           
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

#Preview {
    OnboardingView()
}
