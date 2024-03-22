//
//  ContentView.swift
//  GoogleGemini
//
//  Created by Thanadon Boontawee on 22/3/2567 BE.
//

import SwiftUI
import GoogleGenerativeAI
 
struct ContentView: View {
    let model = GenerativeModel(name: "gemini-pro", apiKey: "AIzaSyCaN2cXEYfnccGdvgBkesZje3lDq-EDgCM")
     
    @State private var output: String = ""
    @State private var prompt: String = ""
     
    var body: some View {
        VStack{
            // User input field
            TextField("Ask a question...", text: $prompt)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Type chat to request a message
            Button("Get Response from Gemini") {
                Task {
                    let response = try await model.generateContent(prompt)
                    if let text = response.text {
                        output = text
                    }
                }
            }
            ScrollView{
                Text(output)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
