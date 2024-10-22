//
//  ContentView.swift
//  Todo App
//
//  Created by Singgih Aji Sasongko on 22/10/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var showingAddTodoView: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                Text("halo \(item)")
            } //: LIST
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                self.showingAddTodoView.toggle()
                }, label: {
                        Image(systemName: "plus")
                    })//: ADD BUTTON
                .sheet(isPresented: $showingAddTodoView, content: {
                    AddTodoView()
                })
                )
            
        } //: NAVIGATION
    }
}

#Preview {
    ContentView()
}
