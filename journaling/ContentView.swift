//
//  ContentView.swift
//  journaling
//
//  Created by Dana Alghamdi on 18/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

            VStack {
                
                Image("icon")
                    .resizable()
                    .frame(width: 77.7,height: 101)
                    
                Text("Journali")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .font(.system(size: 42))
                
                Text("Your thought, your story")
                    .foregroundColor(.white)
                    .padding(.top, -12)
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
            
            
        }
    }


#Preview {
    ContentView()
}
