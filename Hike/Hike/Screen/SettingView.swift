//
//  SettingView.swift
//  Hike
//
//  Created by Singgih Aji Sasongko on 25/10/24.
//

import SwiftUI

struct SettingView: View {
    // MARK: - PROPERTIES
  
    var body: some View {
        List {
            // MARK: - SECTION: HEADER
            Section {
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                                colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
                               startPoint: .top,
                               endPoint: .bottom
                    )
                ).padding(.top, 8)
                
                VStack (spacing: 8) {
                    Text("Where you can find \nperfect tracks?")
                        .font(.title2)
                    .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the day hike")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                
              
                // MARK: - SECTION: ICONS
                
                // MARK: - SECTION: ABOUT
            }
            .listRowSeparator(.hidden)
            
            Section (
                header: Text("About The APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright All right reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ){
                CustomListRowView(
                    rowLabel: "Application",
                    rowIcon: "apps.iphone",
                    rowContent: "HIKE",
                    rowTintColor: .blue
                )
                CustomListRowView(
                    rowLabel: "Compatibility",
                    rowIcon: "info.circle",
                    rowContent: "iOS, iPadOS",
                    rowTintColor: .red
                )
                CustomListRowView(
                    rowLabel: "Technology",
                    rowIcon: "swift",
                    rowContent: "Swift",
                    rowTintColor: .orange
                )
                CustomListRowView(
                    rowLabel: "Version",
                    rowIcon: "gear",
                    rowContent: "1.0",
                    rowTintColor: .purple
                )
                CustomListRowView(
                    rowLabel: "Developer",
                    rowIcon: "ellipsis.curlybraces",
                    rowContent: "John Doe",
                    rowTintColor: .mint
                )
                CustomListRowView(
                    rowLabel: "Designer",
                    rowIcon: "paintpalette",
                    rowContent: "Robert Pettras",
                    rowTintColor: .blue
                )
                CustomListRowView(
                    rowLabel: "Website",
                    rowIcon: "globe",
                    rowTintColor: .indigo,
                    rowLinkLabel: "Youtube",
                    rowLinkDestination: "https://www.youtube.com"
                )
            } //SECTION
        } //LIST
    }
}

#Preview {
    SettingView()
}
