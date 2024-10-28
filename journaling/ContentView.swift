//
//  ContentView.swift
//  journaling
//
//  Created by Dana Alghamdi on 18/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false

    var body: some View {
        ZStack {
            if isActive {
                // Replace this with your main app view
                EmptyStateView()
            } else {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    VStack {
                        Image("icon")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Journali")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.black)
                        Text("Your thoughts, your story")
                            .foregroundStyle(.white)
                    }
                    .padding()
                }
                .onAppear {
                    // Simulate a delay for the splash screen (e.g., 2 seconds)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
