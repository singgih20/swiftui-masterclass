//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Singgih Aji Sasongko on 05/11/24.
//

import SwiftUI

struct SettingsLabelView: View {
    var labelText: String
    var labelImage: String = ""
    var labelRightText: String = ""
    var labelUrl: String = ""
    var body: some View {
        HStack {
            if (labelRightText != "") {
                Text(labelText).foregroundColor(.gray)
                Spacer()
                Text(labelRightText)
                    .fontWeight(.bold)
                if let validURL = URL(string: labelUrl) {
                    Link(destination: validURL) {
                        Image(systemName: "arrow.up.forward.app")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                    }
                }
             
            } else {
                Text(labelText.uppercased()).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Image(systemName: labelImage)
            }
        }
    
    }
}

#Preview {
    SettingsLabelView(labelText: "Developer", labelRightText: "John / Joe", labelUrl: "https://wikipedia.com")
        .padding()
}
