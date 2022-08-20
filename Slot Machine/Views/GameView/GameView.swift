//
//  GameView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 19/08/2022.
//

import SwiftUI

struct GameView: View {
    @State private var showingInfoView: Bool = false
    @State private var showingModal: Bool = false
    @State private var coins: Int = 100
    @Binding var isOpen: Bool
    
    var body: some View {
        ZStack{
            // MARK: - BACKGROUND
            Color(red: 0.9882352941, green: 0.7607843137, blue: 0).ignoresSafeArea(.all)
            
            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                
                // MARK: - HEADER
                HeaderView().padding(.top, 30)
                
                Button(action: {
                    print("Reset game")
                }) {
                    Image(systemName: "arrow.2.circlepath.circle")
                        .font(.title)
                        .accentColor(Color.black)
                }

                
                // MARK: - SLOT MACHINE
                SlotMachineView(showingModal: $showingModal, coins: $coins)
                
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
                .frame(maxWidth: 720)
                .blur(radius: $showingModal.wrappedValue ? 5 : 0, opaque: false)
            
            
            // MARK: - POPUP MODAL
            if $showingModal.wrappedValue {
                ZStack{
                    
                    
                    // MODAL
                    VStack(spacing: 0){
                        Text("Game Over")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color("ColorPink"))
                            .foregroundColor(Color.white)
                        
                        Spacer()
                        
                        // MESSAGE
                        VStack(alignment: .center, spacing: 16) {
                          Image("gfx-seven-reel")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 72)
                          
                          Text("Bad luck! You lost all of the coins. \nLet's play again!")
                            .font(.system(.body, design: .rounded))
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.gray)
                            .layoutPriority(1)
                          
                          Button(action: {
                            self.showingModal = false
//                            self.animatingModal = false
//                            self.activateBet10()
                            self.coins = 100
                          }) {
                            Text("New Game".uppercased())
                              .font(.system(.body, design: .rounded))
                              .fontWeight(.semibold)
                              .accentColor(Color("ColorPink"))
                              .padding(.horizontal, 12)
                              .padding(.vertical, 8)
                              .frame(minWidth: 128)
                              .background(
                                Capsule()
                                  .strokeBorder(lineWidth: 1.75)
                                  .foregroundColor(Color("ColorPink"))
                              )
                          }
                        }
                        
                        Spacer()
                        
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .top)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 8)
//                    .opacity($animatingModal.wrappedValue ? 1 : 0)
//                    .offset(y: $animatingModal.wrappedValue ? 0 : -100)
//                    .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0), value: showingModal)
//                    .onAppear(perform: {
//                      self.animatingModal = true
//                    })
                }
            }
                
            
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