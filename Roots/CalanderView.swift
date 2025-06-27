//
//  CalanderView.swift
//  Roots
//
//  Created by student on 6/19/25.
//

import SwiftUI

struct Event: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let date: Date
}

struct Day: Identifiable {
    let id = UUID()
    let date: Date
    let isToday: Bool
    let hasEvent: Bool
}

struct CalanderView: View {
    @State private var selectedDate = Date()
    @State private var displayedMonth = Date()
    
    private let calendar = Calendar.current
    
    // Sample event list
    private let events: [Event] = [
        Event(title: "Diwali Celebration", date: Date()),
        Event(title: "Langar at Temple", date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
        Event(title: "Youth Cleanup", date: Calendar.current.date(byAdding: .month, value: 1, to: Date())!)
    ]
    
    private var daysInDisplayedMonth: [Day] {
        let range = calendar.range(of: .day, in: .month, for: displayedMonth)!
        let components = calendar.dateComponents([.year, .month], from: displayedMonth)
        let startOfMonth = calendar.date(from: components)!

        return range.compactMap { day -> Day in
            let date = calendar.date(byAdding: .day, value: day - 1, to: startOfMonth)!
            return Day(
                date: date,
                isToday: calendar.isDateInToday(date),
                hasEvent: events.contains { calendar.isDate($0.date, inSameDayAs: date) }
            )
        }
    }
    
    private var columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 10), count: 7)

    var body: some View {
        ZStack {
            Color("NewYellow").edgesIgnoringSafeArea(.all)

            VStack(spacing: 0) {
                Text("Calendar")
                    .font(.system(size: 44, weight: .bold))
                    .padding(.top)

                Divider()
                    .background(Color.gray.opacity(0.3))
                    .padding(.bottom, 10)

                // Month Header with navigation
                HStack {
                    Button(action: { displayedMonth = changeMonth(by: -1) }) {
                        Image(systemName: "chevron.left")
                    }

                    Spacer()

                    Text(monthYearString(from: displayedMonth))
                        .font(.title2)
                        .fontWeight(.semibold)

                    Spacer()

                    Button(action: { displayedMonth = changeMonth(by: 1) }) {
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 5)

                // Weekday labels
                HStack {
                    ForEach(["S", "M", "T", "W", "T", "F", "S"], id: \.self) { day in
                        Text(day)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal)

                // Calendar Grid
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(daysInDisplayedMonth) { day in
                        VStack {
                            Text("\(calendar.component(.day, from: day.date))")
                                .foregroundColor(calendar.isDate(day.date, inSameDayAs: selectedDate) ? .white : .black)
                                .fontWeight(day.isToday ? .bold : .regular)
                                .frame(width: 36, height: 36)
                                .background(calendar.isDate(day.date, inSameDayAs: selectedDate) ? Color.blue : Color.clear)
                                .clipShape(Circle())

                            if day.hasEvent {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 6, height: 6)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            selectedDate = day.date
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)

                Divider().padding(.vertical, 8)

                // Events for Selected Date
                VStack(alignment: .leading, spacing: 8) {
                    Text("Events on \(formattedDate(selectedDate))")
                        .font(.headline)

                    let dailyEvents = events.filter { calendar.isDate($0.date, inSameDayAs: selectedDate) }

                    if dailyEvents.isEmpty {
                        Text("No events today.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(dailyEvents) { event in
                            Text("• \(event.title)")
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.horizontal)

                Spacer()

                // Bottom Nav
                bottomNavBar
            }
        }
    }

    // MARK: - Helpers

    func changeMonth(by value: Int) -> Date {
        calendar.date(byAdding: .month, value: value, to: displayedMonth) ?? displayedMonth
    }

    func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }

    var bottomNavBar: some View {
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
        .padding(.bottom, 20)
        .navigationBarBackButtonHidden(true)
    }
}
