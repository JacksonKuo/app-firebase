//
//  app_firebase.swift
//  app-firebase
//
//  Created by JacksonKuo on 12/1/24.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        FirebaseApp.configure()
        if let app = FirebaseApp.app() {
            print("Firebase successfully configured: \(app.name)")
        } else {
            print("Failed to configure Firebase.")
        }
    }
}


@main
struct app_firebase: App {
    // Create the AppDelegate
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
