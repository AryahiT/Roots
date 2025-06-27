//
//  ContentView 2.swift
//  Roots
//
//  Created by student on 6/16/25.
//


import SwiftUI
import AuthenticationServices  // For Sign in with Apple

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showForgotPassword = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color("NewYellow").edgesIgnoringSafeArea(.all)
                
                VStack {
                    // write Login Below the marigold image at the top of the screen
                    Image("MarigoldLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .offset(y: -270) // negative moves it up, positive moves it down
                    
                    Text("Login")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundColor(Color("AccentColor"))
                        .offset(y: -280) // negative moves it up, positive moves it down
                    // write "Enter your email and password to Login" below "Login"
                    Text("Enter your email and password\nto Login")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color("NewBlue"))
                        .offset(y: -250)
                }
                // add two squares with email and password written below it
                VStack(spacing:12) {
                    //username box
                    //firebase storing of usernames and passwords!!
                    TextField("   Email", text: $email)
                        .frame(width:325, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                        .padding(.leading, 25)
                        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
                    SecureField("   Password", text: $password)
                        .frame(width:325, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                        .padding(.leading, 25)
                        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
                    //if incorrect display "Incorrect Password Stuff at the top
                }
                .offset(y: -20)
                
                // write forgot password below that
                NavigationLink(destination: ForgotPasswordView()) {
                    Text("Forgot Password?")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(Color("NewBlue"))
                        
                }
                .offset(y: +65)
                .offset(x: +80)
                
                // Create the Login Button that will direct you to the home page
                NavigationLink(destination: HomeView()) {
                    Text("LogIn")
                        .frame(width: 290, height: 50)
                        .background(Color("AccentColor"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.system(size: 18, weight: .semibold))
                        .shadow(radius: 2)
                }
                .offset(y: 130)
                
                HStack(spacing: 1) {
                                    // Sign in with Apple
                                    SignInWithAppleButton(
                                        onRequest: { request in
                                            request.requestedScopes = [.fullName, .email]
                                        },
                                        onCompletion: { result in
                                            // Handle result here
                                        }
                                    )
                                    .signInWithAppleButtonStyle(.black)
                                    .frame(height: 40)
                                    .frame(width: 137)
                                    .cornerRadius(10)
                                    .offset(x: 16)

                                    // Login with Google - visual button
                                    Button(action: {
                                        // Trigger Google sign-in logic here
                                    }) {
                                        HStack {
                                            Image(systemName: "globe")
                                                .foregroundColor(.white)
                                            Text("Sign in with Google")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 40)
                                        .frame(width: 137)
                                        .background(Color.red)
                                        .cornerRadius(10)
                                        .padding(.horizontal, 20)
                                    }
                                }
                                .offset(y: 200)
                
                //add the Login with Google/Facebook
                
                //Add the Navigation Link for: Don't Already Have An Account? Register! ;; with register bolded
                NavigationLink(destination: RegisterView()) {
                    Text("Don't Already Have An Account?")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(Color("NewBlue"))
                    + Text(" Register!").bold()
                        .font(.system(size: 15))
                        .foregroundColor(Color("NewBlue"))
                }
                .offset(y: +260)
                //Add the Navigation Link for: Need Help? Visit Our Help Center ;; with Help Center bolded
                NavigationLink(destination: HelpCenterView()) {
                    Text("Need Help? Visit Our ")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(Color("NewBlue"))
                    + Text("Help Center").bold()
                        .font(.system(size: 15))
                        .foregroundColor(Color("NewBlue"))
                }
                .offset(y: +300)

            }
        }
    }
}

struct ForgotPasswordView: View {
    var body: some View {
        ZStack {
            Color("NewYellow").ignoresSafeArea()
            Text("Too Bad")
                .scaledToFit()
                .padding()
                .font(.system(size: 100, weight: .semibold))
        }
    }
}
