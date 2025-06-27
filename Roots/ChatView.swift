//
//  ChatView.swift
//  Roots
//
//  Created by student on 6/17/25.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack {
            Color("NewYellow").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Chat")
                    .font(.system(size: 40, weight: .bold))
                    .padding(.top)
                
                List {
                    ForEach(mockChats) { chat in
                        NavigationLink(destination: ChatDetailView(chat: chat)) {
                            HStack {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.blue)
                                VStack(alignment: .leading) {
                                    Text(chat.name)
                                        .font(.headline)
                                    Text(chat.lastMessage)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text(chat.time)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
            }
        }
    }
}

struct ChatDetailView: View {
    var chat: ChatModel
    @State private var message = ""

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(chat.messages, id: \.self) { msg in
                        Text(msg)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()
            }

            HStack {
                TextField("Type a message...", text: $message)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 1)
                Button("Send") {
                    // Send logic here
                    message = ""
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle(chat.name)
    }
}

struct ChatModel: Identifiable {
    let id = UUID()
    let name: String
    let lastMessage: String
    let time: String
    let messages: [String]
}

let mockChats: [ChatModel] = [
    ChatModel(name: "Riya Sharma", lastMessage: "See you tomorrow!", time: "9:45 AM", messages: ["Hey!", "What's up?", "See you tomorrow!"]),
    ChatModel(name: "Aarav Patel", lastMessage: "Thanks for the help!", time: "8:12 PM", messages: ["Can you send me the link?", "Thanks for the help!"])
]
