//
//  HomeView.swift
//  Roots
//
//  Created by student on 6/16/25.
//

import SwiftUI


struct HomeView: View {
    var body: some View {
        ZStack {
            Color("NewYellow").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // Top bar
                HStack {
                    Text("ROOTS")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 2)
                        .foregroundColor(Color("AccentColor"))
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        NavigationLink(destination: SettingsView()) {
                            Image("SettingsIcon")
                                .resizable()
                                .frame(width: 45, height: 45)
                        }
                        NavigationLink(destination: ChatView()) {
                            Image("ChatIcon")
                                .resizable()
                                .frame(width: 45, height: 45)
                        }
                    }
                    .padding(.top, 17) // Account for notch
                    .padding(.horizontal)
                }
                
                Spacer()
                
                
                //bottom Nav Bar
                Divider() 
                    .background(Color.gray.opacity(0.3))
                    .padding(.bottom, 17)
                
                HStack(spacing: 20) {
                    NavigationLink(destination: HomeView()) {
                        Image("Home")
                            .resizable()
                            .frame(width: 45, height: 45)
                    }
                    NavigationLink(destination: CalanderView()) {
                        Image("Calander")
                            .resizable()
                            .frame(width: 45, height: 45)
                    }
                    NavigationLink(destination: GroupsView()) {
                        Image("Groups")
                            .resizable()
                            .frame(width: 45, height: 45)
                    }
                    NavigationLink(destination: ProfileView()) {
                        Image("Profile")
                            .resizable()
                            .frame(width: 45, height: 45)
                    }
                    NavigationLink(destination: FriendsRMView()) {
                        Image("FriendRM")
                            .resizable()
                            .frame(width: 45, height: 45)
                    }
                    NavigationLink(destination: HamView()) {
                        Image("Options")
                            .resizable()
                            .frame(width: 45, height: 45)
                    }
                    .navigationBarBackButtonHidden(true)

                }
            }
            
        }
    }
}

