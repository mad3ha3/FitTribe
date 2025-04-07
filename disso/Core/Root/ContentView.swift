//
//  ContentView.swift
//  disso
//
//  Created by Madeha Ahmed on 17/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // MARK: Background
            
            
            
            // MARK: Content
            VStack (alignment: .leading, spacing: 15) {
                //app name
                Text("FitTribe")
                
                //slogan
                Text("get FiTogether")
                
                
                //Get Started
                Button( action: {
                    
                },
                        label: {
                    Text("get started")
                }
                )
            }
            }
        }
    
    
}

#Preview {
    ContentView()
}
