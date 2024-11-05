//
//  SettingsView.swift
//  Fructus
//
//  Created by Singgih Aji Sasongko on 05/11/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    GroupBox(
                        label: 
                            HStack {
                              SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                            }
                        ) {
                            Divider().padding(.vertical, 4)
                            
                            HStack(alignment: .center, spacing: 10) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(9)
                                Spacer()
                                Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essentials nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                    .font(.footnote)
                            }
                        }
                    
                    GroupBox(label:
                                HStack {
                                    SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                                }
                    ) {                        
                        Divider().padding(.vertical, 4)
                        SettingsLabelView(labelText: "Developer", labelRightText: "John Jane")
                        Divider().padding(.vertical, 4)
                        SettingsLabelView(labelText: "Designer", labelRightText: "Robert Petras")
                        Divider().padding(.vertical, 4)
                        SettingsLabelView(labelText: "Compatibility", labelRightText: "iOS 14")
                        Divider().padding(.vertical, 4)
                        SettingsLabelView(labelText: "Website", labelRightText: "Singgih", labelUrl: "https://singgih.com")
                        Divider().padding(.vertical, 4)
                        SettingsLabelView(labelText: "Twitter", labelRightText: "@singgihajii", labelUrl: "https://x.com/singgihajii")
                        Divider().padding(.vertical, 4)
                        SettingsLabelView(labelText: "SwiftUI", labelRightText: "2.0")
                        Divider().padding(.vertical, 4)
                        SettingsLabelView(labelText: "Version", labelRightText: "1.0")
                    }
                }
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                        }
                )
                .padding()
            }
        }
    }
}

#Preview {
    SettingsView()
}
