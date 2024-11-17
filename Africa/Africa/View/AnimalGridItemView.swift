//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Singgih Aji Sasongko on 17/11/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: Animal
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}


struct AnimalGridViewItem_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalDetailView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
