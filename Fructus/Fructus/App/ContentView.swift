//
//  ContentView.swift
//  Fructus
//
//  Created by Singgih Aji Sasongko on 03/11/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    var fruits: [Fruit] = fruitsData
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
            .previewDevice("iPhone 11 Pro")
    }
}
