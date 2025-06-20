//
//  HelpCenterView.swift
//  Roots
//
//  Created by student on 6/16/25.
//

import SwiftUI

struct HelpCenterView: View {
    var body: some View {
        ScrollView {
            ZStack {
                Color("NewYellow").edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Title
                    Text("Help Center")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 10)
                    
                    // Intro Text
                    Text("""
                Welcome to the Roots Help Center. We're here to assist you with any issues or questions you may have while using the app. Below you'll find answers to some common questions. If you still need help, feel free to contact us!
                """)
                    
                    // Contact Info
                    Text("Contact Us")
                        .font(.headline)
                    Text("For further support, email us at:")
                    Text("RootsFindYourPeople@yahoo.com")
                        .foregroundColor(.blue)
                        .underline()
                    
                    Divider()
                    
                    // FAQ Section
                    Text("Frequently Asked Questions")
                        .font(.title2)
                    
                    Group {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("What should I do if the app isn't working?")
                                .font(.subheadline)
                                .bold()
                            Text("Try closing and reopening the app. Make sure you're connected to the internet. If the problem continues, contact us at the email above\n.")
                            
                            Text("I forgot my password. How can I reset it?")
                                .font(.subheadline)
                                .bold()
                            Text("Go to the login screen and tap 'Forgot Password'. You'll receive an email with reset instructions.\n")
                            
                            Text("Why can't I find a specific cultural or religious group?")
                                .font(.subheadline)
                                .bold()
                            Text("We’re constantly adding new communities. If something’s missing, feel free to suggest it by emailing us.\n")
                            
                            Text("How do I report inappropriate content?")
                                .font(.subheadline)
                                .bold()
                            Text("Tap the 'Report' option next to a post or message. You can also email us directly with details.\n")
                        }
                    }
                    
                    Divider()
                    
                    // Extra info / filler text
                    Text("Still need help?")
                        .font(.headline)
                    Text("""
                Our team usually replies within 24–48 hours. We’re here to make sure you have the best possible experience finding your community on Roots.\n
                Don't hesitate to reach out!
                """)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
            }
            .navigationTitle("Help Center")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
