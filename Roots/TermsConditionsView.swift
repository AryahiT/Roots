//
//  TermsConditionsView.swift
//  Roots
//
//  Created by student on 6/17/25.
//

import SwiftUI

struct TermsConditionsView: View {
    var body: some View {
        ZStack {
            Color("NewYellow").edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Title
                    Text("Roots\nTerms and Conditions")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 10)
                    
                    // Last Updated
                    Text("Last Updated: June 20, 2025")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    // Intro
                    Text("""
                Welcome to Roots! Roots is a platform designed to help users discover and connect with religious and cultural communities. By using Roots, you agree to the following terms:
                """)
                    
                    Group {
                        // Section 1
                        Text("1. Who Can Use Roots")
                            .font(.headline)
                        Text("You must be 13 years or older to use this app.")
                        Text("If you are under 18, you must have permission from a parent or legal guardian.")
                        
                        // Section 2
                        Text("2. Respectful Behavior")
                            .font(.headline)
                        Text("Roots is a place for learning, connection, and respectful conversation.")
                        Text("You agree not to post any content that is:")
                        Text("""
                    • Hateful, threatening, or discriminatory
                    • Violent or sexually explicit
                    • False or misleading
                    • Spam or unauthorized advertising
                    """)
                    }
                    
                    Group {
                        // Section 3
                        Text("3. Your Content")
                            .font(.headline)
                        Text("You own the content you post (like messages, posts, or photos).")
                        Text("By posting, you give Roots permission to display, share, or moderate that content as part of the platform.")
                        Text("You are responsible for what you post.")
                        
                        // Section 4
                        Text("4. Account Security")
                            .font(.headline)
                        Text("Keep your login information safe.")
                        Text("Don’t impersonate others or create fake accounts.")
                    }
                    
                    Group {
                        // Section 5
                        Text("5. Privacy")
                            .font(.headline)
                        Text("We respect your privacy. Please review the FireBase Privacy Policy to understand how we handle your information.")
                        Text("We will never sell your data.")
                        
                        // Section 6
                        Text("6. Moderation and Removal")
                            .font(.headline)
                        Text("We may remove content or suspend accounts that break these rules.")
                        Text("Repeated violations may result in permanent removal.")
                        
                        // Section 7
                        Text("7. Changes to These Terms")
                            .font(.headline)
                        Text("We may update these Terms occasionally. We'll notify you of major changes in the app or by email.")
                        
                        // Section 8
                        Text("8. Contact Us")
                            .font(.headline)
                        Text("Have questions? Contact us at RootsFindYourPeople@yahoo.com")
                    }
                }
                .padding(20)
            }
            .navigationTitle("Terms & Conditions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
