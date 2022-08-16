//
//  ContentView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 16/08/2022.
//

import SwiftUI

// MARK: - PROPERTIES


struct ContentView: View {
    
    // MARK: - BODY
    
    var body: some View {
        
        ZStack{
            // MARK: - BACKGROUND
            Color(red: 0.9882352941, green: 0.7607843137, blue: 0).ignoresSafeArea(.all)
            
            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                
                // MARK: - HEADER
                HeaderView().padding()
                    
                // MARK: - SCORE
                ScoreView().padding()
                
                // MARK: - SLOT MACHINE
                SlotMachineView()
                
                // SPIN BUTTON
                Button(action: {
                    print("Spin")
                }) {
                    Image("gfx-spin")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 50, idealWidth: 80, maxWidth: 90, minHeight: 55, idealHeight: 75, maxHeight: 85, alignment: .center)
                        .shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 6)
                }
                
                Spacer()
                // MARK: - FOOTER
                
                
            }
            .overlay(
                // RESET BUTTON
                Button(action: {
                    print("Reset the game")
                }) {
                    Image(systemName: "arrow.2.circlepath.circle")
                }
                    .font(.title)
                    .accentColor(Color.black), alignment: .topLeading
            )
            .overlay(
                // INFO BUTTON
                Button(action: {
                    print("Show Info")
                }) {
                    Image(systemName: "info.circle")
                }
                    .font(.title)
                    .accentColor(Color.black), alignment: .topTrailing
            )
            
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
