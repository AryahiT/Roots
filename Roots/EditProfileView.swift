//
//  EditProfileView.swift
//  Roots
//
//  Created by student on 6/27/25.
//

import SwiftUI

struct EditProfileView: View {
    @State private var name = ""
    @State private var bio = ""

    var body: some View {
        ZStack {
            Color("NewYellow").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Edit Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                TextField("Full Name", text: $name)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                
                TextField("Bio", text: $bio)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                
                Button("Save Changes") {
                    // Save logic here
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)

                Spacer()
            }
            .padding()
        }
    }
}
