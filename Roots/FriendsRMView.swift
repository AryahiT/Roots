//
//  FriendsRMView.swift
//  Roots
//
//  Created by student on 6/19/25.
//

import SwiftUI

enum MatchType {
    case friend
    case roommate
}

class MatchData: ObservableObject {
    @Published var matchType: MatchType? = nil
    @Published var answers: [String] = []
    @Published var showResults = false
}

struct FriendsRMView: View {
    @StateObject var matchData = MatchData()

    var body: some View {
        NavigationView {
            ZStack {
                Color("NewYellow").edgesIgnoringSafeArea(.all)

                VStack(spacing: 0) {
                    Spacer(minLength: 10)

                    if matchData.showResults {
                        MatchResultsView(matchData: matchData)
                    } else if matchData.matchType == nil {
                        MatchTypeSelectionView(matchData: matchData)
                    } else {
                        FriendRoommateQuestionsView(matchData: matchData)
                    }

                    Spacer()

                    Divider()
                        .background(Color.gray.opacity(0.3))
                        .padding(.bottom, 10)

                    // True Bottom Nav Bar
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

// MARK: Selection View
struct MatchTypeSelectionView: View {
    @ObservedObject var matchData: MatchData

    var body: some View {
        VStack(spacing: 30) {
            Text("Who are you looking for?")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top)

            Button("👯 A Friend") {
                matchData.matchType = .friend
            }
            .buttonStyle(.borderedProminent)

            Button("🏠 A Roommate") {
                matchData.matchType = .roommate
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

// MARK: Question Flow
struct FriendRoommateQuestionsView: View {
    @ObservedObject var matchData: MatchData
    @State private var currentQuestion = 0

    let friendQuestions = [
        ("What do you enjoy on weekends?", ["Hiking", "Gaming", "Volunteering"]),
        ("Your ideal way to hang out?", ["Deep convos", "Group fun", "Quiet time"]),
        ("Favorite music?", ["Pop", "Classical", "Indie"]),
        ("Introvert or Extrovert?", ["Introvert", "Ambivert", "Extrovert"])
    ]

    let roommateQuestions = [
        ("How clean are you?", ["Very tidy", "Somewhat tidy", "Messy"]),
        ("Sleep schedule?", ["Early riser", "Night owl", "Flexible"]),
        ("Do you host guests often?", ["Frequently", "Sometimes", "Rarely"]),
        ("Noise preference?", ["Quiet", "Moderate", "Lively"])
    ]

    var body: some View {
        let (question, options) = matchData.matchType == .friend ? friendQuestions[currentQuestion] : roommateQuestions[currentQuestion]

        VStack(spacing: 30) {
            Text(question)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top)

            ForEach(options, id: \.self) { option in
                Button(option) {
                    answer(option)
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            }
        }
        .padding()
    }

    func answer(_ option: String) {
        matchData.answers.append(option)
        let totalQuestions = matchData.matchType == .friend ? 4 : 4
        if currentQuestion + 1 < totalQuestions {
            currentQuestion += 1
        } else {
            matchData.showResults = true
        }
    }
}

// MARK: Match Results
struct MatchProfile: Identifiable {
    let id = UUID()
    let name: String
    let bio: String
    let sharedScore: Int
}

struct MatchResultsView: View {
    @ObservedObject var matchData: MatchData

    let mockMatches: [MatchProfile] = [
        MatchProfile(name: "Aanya Patel", bio: "Loves chai, long walks & quiet roommates.", sharedScore: 5),
        MatchProfile(name: "Rohan Mehta", bio: "Tech-savvy, early bird, clean lifestyle.", sharedScore: 4),
        MatchProfile(name: "Neha Kapoor", bio: "Dances to Bollywood and loves late-night convos.", sharedScore: 3)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Your Top Matches")
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)

                ForEach(mockMatches) { match in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.blue)
                            VStack(alignment: .leading) {
                                Text(match.name)
                                    .font(.headline)
                                Text(match.bio)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }

                        Text("Compatibility Score: \(match.sharedScore)/5")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        Button("Send Friend Request") {
                            // Friend request logic
                        }
                        .font(.subheadline)
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
                    .padding(.horizontal)
                }
            }
        }
    }
}
