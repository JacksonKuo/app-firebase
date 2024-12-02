//
//  ContentView.swift
//  app-firebase
//
//  Created by JacksonKuo on 12/1/24.
//

import SwiftUI
import Firebase

struct ContentView: View {
    var body: some View {
        VStack {
            Text("swift app")
            
            Button(action: {
                print("Button was pressed!")
                
                let db = Firestore.firestore()
                let docRef = db.collection("col1").document("doc1")

                Task {
                    do {
                        let document = try await docRef.getDocument()
                        if document.exists {
                            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                            print("Document data: \(dataDescription)")
                        } else {
                            print("Document does not exist")
                        }
                    } catch {
                        print("Error getting document: \(error)")
                    }
                }
            }) {
                Text("Press Me")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
