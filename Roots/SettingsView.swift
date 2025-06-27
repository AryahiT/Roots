//
//  SettingsView.swift
//  Roots
//
//  Created by student on 6/17/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color("NewYellow").edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .padding(.horizontal)

                    // Profile Section
                    SectionView(title: "Profile") {
                        NavigationLink(destination: EditProfileView()) {
                            Text("Edit Profile Info")
                        }
                        NavigationLink(destination: ChangePictureView()) {
                            Text("Change Profile Picture")
                        }
                    }

                    // Preferences Section
                    SectionView(title: "Preferences") {
                        Toggle("Enable Notifications", isOn: .constant(true))
                        Toggle("Make Profile Public", isOn: .constant(false))
                    }

                    // Account Section
                    SectionView(title: "Account") {
                        Button("Log Out") {
                            // Log out logic
                        }
                        Button("Delete Account") {
                            // Delete logic
                        }
                        .foregroundColor(.red)
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 50)
            }
        }
    }
}

struct SectionView<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.headline)
                .padding(.bottom, 5)
            content
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        .padding(.horizontal)
    }
}
