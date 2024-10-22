//
//  mainpage.swift
//  journaling
//
//  Created by Dana Alghamdi on 18/04/1446 AH.
//

import SwiftUI

struct mainpage: View {
    var body: some View {
        ZStack{
            
            Color.black.edgesIgnoringSafeArea(.all)
            
                HStack{
                    Text("Journal").font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                    Image(systemName: "line.3.horizontal.decrease.circle.fill").font(.title)
                        .foregroundStyle(.btnBg)
                        .background(Color.pur)
                        .clipShape(.circle)
                    Image(systemName: "plus.circle.fill").font(.title).foregroundStyle(.btnBg).background(Color.pur).clipShape(.circle)
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
                .padding(30)
            VStack{
                
                TextField("search,", text: $searchText)
                    .padding(7)
                    .background(Color(.btnBg))
                    .cornerRadius(8)
            }
            
        }
    }
}

#Preview {
    mainpage()
}
