//
//  ContentView.swift
//  Roots
//
//  Created by student on 6/16/25.
//

import SwiftUI

struct ContentView: View {
    // create the if else statement for splash screen/login view
    @State private var isActive = false

    var body: some View {
        if isActive {
            LoginView()
        } else {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
        }
    }
}

struct SplashView: View {
    var body: some View {
        ZStack {
            Color("NewYellow").edgesIgnoringSafeArea(.all)

            VStack {
                Image("MarigoldLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 210, height: 210)
                
                Text("Roots")
                    .font(.system(size: 39, weight: .bold))
                    .foregroundColor(Color("AccentColor"))
            }
            .offset(y: 5)
        }
    }
}

#Preview {
    ContentView()
}
