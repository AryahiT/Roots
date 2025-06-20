//
//  RegisterView.swift
//  Roots
//
//  Created by student on 6/16/25.
//

import SwiftUI

struct RegisterView : View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var Password : String = ""
    @State private var ConfirmPassword : String = ""

    var body: some View {
        ZStack {
            Color("NewYellow").edgesIgnoringSafeArea(.all)
            
            VStack {
                // write Login Below the marigold image at the top of the screen
                Image("MarigoldLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .offset(y: -270)
                Text("Register")
                    .font(.system(size: 40))
                    .foregroundColor(Color("AccentColor"))
                    .offset(y: -290) // negative moves it up, positive moves it down
                // write "Enter your details to Register"
                Text("Enter your details to Register")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .light))
                    .foregroundColor(Color("NewBlue"))
                    .offset(y: -270)
            }
            VStack(spacing: 10) { // adjust this value as needed
                Group {
                    TextField("   First Name", text: $firstName)
                    TextField("   Last Name", text: $lastName)
                    TextField("   Email", text: $email)
                    TextField("   Phone Number", text: $phoneNumber)
                    TextField("   Password", text: $Password)
                    TextField("   Confirm Password", text: $ConfirmPassword)
                }
                .frame(width: 295, height: 40)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
                .padding(.vertical, 2) // small vertical padding to control spacing
            }
            .offset(y: 15)

            // Create the Continue Button that will direct you to the questions
            NavigationLink(destination: OnboardingView()) {
                Text("Continue")
                    .frame(width: 290, height: 50)
                    .background(Color("AccentColor"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.system(size: 18, weight: .semibold))
                    .shadow(radius: 2)
            }

            .offset(y: 225)
            //Add the "I agree with the terms and conditions ;; all bolded;; check box next to it
            NavigationLink(destination: TermsConditionsView()) {
                Text("I agree with the terms and conditions").bold()
                    .font(.system(size: 13))
                    .foregroundColor(Color("NewBlue"))
            }
            .offset(y: +270)
            
            //Add the Navigation Link for: Need Help? Visit Our Help Center ;; with Help Center bolded
            NavigationLink(destination: HelpCenterView()) {
                Text("Need Help? Visit Our ")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(Color("NewBlue"))
                + Text("Help Center").bold()
                    .font(.system(size: 15))
                    .foregroundColor(Color("NewBlue"))
            }
            .offset(y: +325)
        }
    }
}

