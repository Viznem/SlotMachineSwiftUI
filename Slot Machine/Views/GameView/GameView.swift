//
//  GameView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 19/08/2022.
//

import SwiftUI

struct GameView: View {
    @State private var showingInfoView: Bool = false
    @Binding var isOpen: Bool
    
    var body: some View {
        ZStack{
            // MARK: - BACKGROUND
            Color(red: 0.9882352941, green: 0.7607843137, blue: 0).ignoresSafeArea(.all)
            
            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                
                // MARK: - HEADER
                HeaderView().padding()
                
                Button(action: {
                    print("Reset game")
                }) {
                    Image(systemName: "arrow.2.circlepath.circle")
                        .font(.title)
                        .accentColor(Color.black)
                }

                
                // MARK: - SCORE
                ScoreView()
                
                // MARK: - SLOT MACHINE
                SlotMachineView().padding(5)
                
                Spacer()
                
                HStack{
                    
                    // MARK: - Bet System
                   BetView()
                    
                    
                    Spacer()
                    
                    // SPIN BUTTON
                    Button(action: {
                        print("Spin")
                    }) {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 100, idealWidth: 160, maxWidth: 180, minHeight: 75, idealHeight: 95, maxHeight: 115, alignment: .center)
                            .shadow(radius: 5)
                    }
                    
                }

                Spacer()
            
            }//VStack
            .overlay(
                // INFO BUTTON
                Button(action: {
                    self.showingInfoView = true
                }) {
                    Image(systemName: "info.circle")
                }
                    .font(.title)
                    .accentColor(Color.black), alignment: .topTrailing
            ).padding()
            
        }//ZStack
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .rotation3DEffect(.degrees(isOpen ? 30: 0), axis: (x: 0, y: -1, z: 0))
        .offset(x: isOpen ? 265 : 0)
        .scaleEffect(isOpen ? 0.9 : 1)
        .ignoresSafeArea()
        .sheet(isPresented: $showingInfoView) {
            InfoView()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(isOpen: .constant(false))
            .previewInterfaceOrientation(.portrait)
    }
}
