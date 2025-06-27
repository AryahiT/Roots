//
//  GroupsView.swift
//  Roots
//
//  Created by student on 6/19/25.
//

import SwiftUI

struct GroupsView: View {
    @State private var showJoinRequest = false
    @State private var joinStatus: String? = nil
    @State private var groupMembers = [
        "Aryahi Tiwari (Moderator)",
        "Riya Patel",
        "Ayaan Sharma",
        "Neha Joshi",
        "Dev Mehta",
        "Anaya Reddy"
    ]
    @State private var showGroupDetails = false
    @State private var selectedTab = 0

    var body: some View {
        ZStack {
            Color("NewYellow").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                Text("Groups")
                    .font(.system(size: 44, weight: .bold))
                    .padding(.top)
                
                Divider()
                    .background(Color.gray.opacity(0.3))
                    .padding(.bottom, 17)

                VStack(alignment: .leading, spacing: 12) {
                    // Tappable group name
                    Button(action: {
                        showGroupDetails.toggle()
                    }) {
                        Text("Hindu Triad Temple")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }

                    Text("A group for local Hindus to share events, volunteer, and stay connected to temple activities.")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    Text("👥 Members: \(groupMembers.count)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(groupMembers, id: \.self) { member in
                                Text(member.components(separatedBy: " ").first ?? member)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 6)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .foregroundColor(.black)
                            }
                        }
                    }

                    Button(action: {
                        showJoinRequest = true
                        simulateApproval()
                    }) {
                        Text("Request to Join")
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.top, 5)
                    
                    if let status = joinStatus {
                        Text(status)
                            .foregroundColor(status.contains("approved") ? .green : .red)
                            .font(.subheadline)
                            .padding(.top, 5)
                    }

                    // Show tabs and content if expanded
                    if showGroupDetails {
                        Picker("", selection: $selectedTab) {
                            Text("Community Board").tag(0)
                            Text("Group Chat").tag(1)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.top)

                        if selectedTab == 0 {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("🧠 Community Board")
                                    .font(.headline)

                                Text("A space to ask questions, share experiences, or post helpful content.")
                                    .font(.subheadline)

                                Text("📌 Posts are sorted by topics like religion, language, or general advice — making it easy to connect and respond.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)

                                ForEach(1..<4) { i in
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Topic \(i): Help with festival planning?")
                                            .fontWeight(.semibold)
                                        Text("Anyone know a good caterer for Diwali events?")
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                }
                            }
                            .padding(.top)
                        } else {
                            VStack {
                                Spacer()
                                Text("💬 Group Chat will be here")
                                    .foregroundColor(.gray)
                                    .padding(.top)
                                Spacer()
                            }
                        }
                    }
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(20)
                .padding(.horizontal)
                .padding(.top, 10)

                Spacer()

                // Bottom Navigation
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
                    NavigationLink(destination: MapView()) {
                        Image("MapIcon")
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
                }
                .padding(.bottom, 20)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    
    // Fake approval system
    func simulateApproval() {
        let approved = Bool.random()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if approved {
                joinStatus = "Your request was approved!"
                groupMembers.append("You")
            } else {
                joinStatus = "Your request was rejected by the group."
            }
        }
    }
}
