//
//  AddTodoView.swift
//  Todo App
//
//  Created by Singgih Aji Sasongko on 22/10/24.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK: - BODY
    
    // MARK: - PREVIEW
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    //MARK:  - TODO NAME
                    TextField("Todo", text: $name)
                    
                    //MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    // MARK: - SAVE BUTTON
                    Button(action: {
                        print("Save a todo new item")
                    }) {
                        Text("Save")
                    }
                }
                
                Spacer()
            }.navigationBarTitle("New Todo", displayMode: .inline)
                .navigationBarItems(trailing:
                Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                )
        }
        
    }
}

#Preview {
    AddTodoView()
}
