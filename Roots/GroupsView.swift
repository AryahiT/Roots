//
//  GroupsView.swift
//  Roots
//
//  Created by student on 6/19/25.
//

import SwiftUI

struct GroupsView: View {
    var body: some View {
        ZStack {
            Color("NewYellow").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                
                Text("Groups")
                    .font(.system(size:69, weight: .bold))
                
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

