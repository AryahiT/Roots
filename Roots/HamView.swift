//
//  HamView.swift
//  Roots
//
//  Created by student on 6/19/25.
//

import SwiftUI

struct UserPost: Identifiable {
    let id = UUID()
    let title: String
    let isForum: Bool
}

struct HamView: View {
    let userPosts = [
        UserPost(title: "Holi Festival Plans", isForum: true),
        UserPost(title: "Organizing Diwali Night", isForum: false)
    ]
    
    let userGroups = ["UNC Hindu Society", "Spiritual Wellness Club"]
    let friends = ["Asha Patel", "Rajiv Menon", "Neha Kapoor"]
    let friendRequests = ["Arjun Shah", "Divya Rao"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("NewYellow").edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    ScrollView {
                        VStack(spacing: 25) {
                            // Profile Section
                            VStack(spacing: 10) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.gray)
                                
                                Text("Your Name")
                                    .font(.title)
                                    .bold()
                                
                                Button("Edit Profile") {
                                    // Add edit action
                                }
                                .font(.subheadline)
                                .padding(.horizontal)
                                .padding(.vertical, 6)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }
                            .padding(.top)
                            
                            // Posts Section
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Your Posts")
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                ForEach(userPosts) { post in
                                    HStack {
                                        Text(post.isForum ? "❓" : "🎉")
                                        Text(post.title)
                                        Spacer()
                                        Text(post.isForum ? "Forum" : "Event")
                                            .font(.caption)
                                            .padding(6)
                                            .background(post.isForum ? Color.purple.opacity(0.8) : Color.blue.opacity(0.8))
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                                    .padding(.horizontal)
                                }
                            }
                            
                            // Groups Section
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Your Groups")
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                ForEach(userGroups, id: \.self) { group in
                                    HStack {
                                        Image(systemName: "person.3.fill")
                                            .foregroundColor(.orange)
                                        Text(group)
                                        Spacer()
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                                    .padding(.horizontal)
                                }
                            }
                            
                            // Friends Section
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Friends")
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                ForEach(friends, id: \.self) { name in
                                    HStack {
                                        Image(systemName: "person.crop.circle.fill")
                                            .foregroundColor(.green)
                                        Text(name)
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            
                            // Friend Requests
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Friend Requests")
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                ForEach(friendRequests, id: \.self) { name in
                                    HStack {
                                        Image(systemName: "person.crop.circle.badge.plus")
                                            .foregroundColor(.blue)
                                        Text(name)
                                        Spacer()
                                        Button("Accept") {}
                                            .font(.caption)
                                            .padding(6)
                                            .background(Color.green)
                                            .foregroundColor(.white)
                                            .cornerRadius(6)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                        .padding(.bottom, 80)
                    }
                    
                    Divider()
                        .background(Color.gray.opacity(0.3))
                        .padding(.bottom, 10)
                    
                    // Bottom Nav
                    HStack(spacing: 20) {
                        NavigationLink(destination: HomeView()) {
                            Image("Home").resizable().frame(width: 45, height: 45)
                        }
                        NavigationLink(destination: CalanderView()) {
                            Image("Calander").resizable().frame(width: 45, height: 45)
                        }
                        NavigationLink(destination: GroupsView()) {
                            Image("Groups").resizable().frame(width: 45, height: 45)
                        }
                        NavigationLink(destination: MapView()) {
                            Image("MapIcon").resizable().frame(width: 45, height: 45)
                        }
                        NavigationLink(destination: FriendsRMView()) {
                            Image("FriendRM").resizable().frame(width: 45, height: 45)
                        }
                        NavigationLink(destination: HamView()) {
                            Image("Options").resizable().frame(width: 45, height: 45)
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                    .padding(.bottom, 10)
                }
            }
        }
    }
}
