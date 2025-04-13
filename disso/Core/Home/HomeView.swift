//
//  HomeView.swift
//  disso
//
//  Created by Madeha Ahmed on 09/04/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20){
            Text("Welcome back to FitTribe!")
                .font(.title)
                .fontWeight(.bold)
            
            HStack {
                VStack{
                    Image(systemName: "flame.fill")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                    Text("Badge: Bronze")
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
