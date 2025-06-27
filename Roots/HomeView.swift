//
//  HomeView.swift
//  Roots
//
//  Created by student on 6/16/25.
//

import SwiftUI

struct ForumEvent: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let date: Date
    let distance: Int // in miles
    let isForum: Bool
    let size: Int // attendees
}

struct HomeView: View {
    @State private var selectedFilter = "All"
    
    let filters = ["All", "Date", "Distance", "Forums", "Event Size"]
    
    let events: [ForumEvent] = [
        ForumEvent(title: "Hindu Temple Visit", description: "Join us for a community visit.", date: Date(), distance: 3, isForum: false, size: 50),
        ForumEvent(title: "Holi Forum", description: "Discuss Holi traditions & colors!", date: Date().addingTimeInterval(-86400), distance: 10, isForum: true, size: 15),
        ForumEvent(title: "Diwali Celebration", description: "Celebrate with lights, food, and family.", date: Date().addingTimeInterval(86400 * 3), distance: 7, isForum: false, size: 200),
        ForumEvent(title: "Vegetarianism in Hinduism", description: "Debate and share experiences.", date: Date().addingTimeInterval(86400 * 2), distance: 4, isForum: true, size: 30)
    ]
    
    var filteredEvents: [ForumEvent] {
        switch selectedFilter {
        case "Date":
            return events.sorted { $0.date < $1.date }
        case "Distance":
            return events.sorted { $0.distance < $1.distance }
        case "Forums":
            return events.filter { $0.isForum }
        case "Event Size":
            return events.sorted { $0.size > $1.size }
        default:
            return events
        }
    }
    
    var body: some View {
        ZStack {
            Color("NewYellow").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // Top Bar
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
                    .padding(.top, 17)
                    .padding(.horizontal)
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Dashboard Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Hindu Forums & Events")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    Picker("Filter", selection: $selectedFilter) {
                        ForEach(filters, id: \.self) { filter in
                            Text(filter).tag(filter)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    
                    
                    ScrollView {
                        ForEach(filteredEvents) { event in
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Text(event.isForum ? "❓ Forum" : "🎉 Event")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(event.isForum ? Color.purple : Color.blue)
                                        .cornerRadius(8)
                                    Spacer()
                                }
                                
                                Text(event.isForum ? "❓ \(event.title)" : event.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                
                                Text(event.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                HStack {
                                    Text("📍 \(event.distance) mi")
                                    Text("🗓 \(event.date.formatted(date: .abbreviated, time: .omitted))")
                                    Text("👥 \(event.size) people")
                                }
                                .font(.caption)
                                .foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(event.isForum ? Color.white.opacity(0.95) : Color.white)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                            .padding(.horizontal, 30)
                            .padding(.bottom, 12)
                        }
                    }
                }
                .padding(.top)
                
                Spacer()
                
                // Bottom Nav Bar
                Divider()
                    .background(Color.gray.opacity(0.3))
                    .padding(.bottom, 10)
                
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
