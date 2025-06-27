//
//  OnboardingView.swift
//  Roots
//
//  Created by student on 6/17/25.
//

import SwiftUI

class OnboardingData: ObservableObject {
    @Published var religion = ""
    @Published var gender = ""
    @Published var dietaryPreference = ""
    @Published var originCountry = ""
    @Published var currentLocation = ""
}

struct ProgressBullets: View {
    let total: Int
    let current: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<total, id: \.self) { index in
                Circle()
                    .fill(index == current ? Color.black : Color.gray.opacity(0.5))
                    .frame(width: 12, height: 12)
            }
        }
        .padding(.bottom, 20)
    }
}
struct MultipleChoiceQuestionView: View {
    let title: String
    let options: [String]
    @Binding var selection: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title2)
                .bold()
                .foregroundColor(.black)

            ForEach(options, id: \.self) { option in
                Button(action: {
                    selection = option
                }) {
                    HStack {
                        Image(systemName: selection == option ? "largecircle.fill.circle" : "circle")
                            .foregroundColor(.black)
                        Text(option)
                            .foregroundColor(.black)
                    }
                    .padding(.vertical, 6)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(12)
        .shadow(radius: 4)
        .padding(.horizontal)
    }
}

struct OnboardingView: View {
    @StateObject var userData = OnboardingData()
    @State private var currentPage = 0
    @State private var navigateToHome = false

    let questions = ["Religion", "Gender", "Dietary Preference", "Country of Origin", "Current Location"]

    var body: some View {
        NavigationStack {
            ZStack {
                Color("NewYellow").edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    ProgressBullets(total: questions.count, current: currentPage)

                    TabView(selection: $currentPage) {
                        MultipleChoiceQuestionView(
                            title: "What religion do you follow?",
                            options: ["Christianity", "Islam", "Hinduism", "Judaism", "Buddhism", "None", "Other"],
                            selection: $userData.religion
                        )
                        .tag(0)

                        MultipleChoiceQuestionView(
                            title: "What is your gender?",
                            options: ["Male", "Female", "Non-binary", "Prefer not to say", "Other"],
                            selection: $userData.gender
                        )
                        .tag(1)

                        MultipleChoiceQuestionView(
                            title: "Any dietary preferences?",
                            options: ["Vegetarian", "Vegan", "Kosher", "Halal", "No preference", "Other"],
                            selection: $userData.dietaryPreference
                        )
                        .tag(2)

                        MultipleChoiceQuestionView(
                            title: "Where are you originally from?",
                            options: ["United States", "India", "Mexico", "China", "Philippines", "Other"],
                            selection: $userData.originCountry
                        )
                        .tag(3)

                        MultipleChoiceQuestionView(
                            title: "Where do you live now?",
                            options: ["United States", "India", "Canada", "United Kingdom", "Other"],
                            selection: $userData.currentLocation
                        )
                        .tag(4)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

                    Button(action: {
                        if currentPage < questions.count - 1 {
                            currentPage += 1
                        } else {
                            // Navigate to HomeView on Finish
                            navigateToHome = true
                        }
                    }) {
                        Text(currentPage == questions.count - 1 ? "Finish" : "Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                    }

                    // Hidden NavigationLink to trigger HomeView on Finish
                    NavigationLink(
                        destination: HomeView(), // Your existing HomeView
                        isActive: $navigateToHome,
                        label: { EmptyView() }
                    )
                    .hidden()
                }
                .padding()
            }
        }
    }
}
