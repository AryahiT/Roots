//
//  ChangePictureView.swift
//  Roots
//
//  Created by student on 6/27/25.
//

import SwiftUI

struct ChangePictureView: View {
    var body: some View {
        ZStack {
            Color("NewYellow").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Change Profile Picture")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                Image(systemName: "person.crop.circle.badge.plus")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
                
                Button("Upload New Picture") {
                    // Upload logic
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
        }
    }
}
