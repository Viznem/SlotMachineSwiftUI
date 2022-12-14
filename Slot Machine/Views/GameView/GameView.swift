/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Truong Thinh
  ID: s3777196
  Created by Thinh, Nguyen Truong on 16/08/2022.
  Last modified: 29/08/2022
  Acknowledgement:
 https://www.youtube.com/watch?v=h4vyOz4Tztg&t=3589s
 https://github.com/TomHuynhSG/RMIT-Casino.git
*/

import SwiftUI



struct GameView: View {
    // MARK: - PROPERTIES
    @State private var showingInfoView: Bool = false
    @State private var showingModal: Bool = false
    @State private var coins: Int = 100
    @State public var playerName: String = ""
    @State public var highestScore: Int = 0
    @State private var animatingModal: Bool = false
    @State private var disableSpin: Bool = false
    
    @Binding var isOpen: Bool
    @Binding var leaderboardList: [Player]
    @Binding var isChallenging: Bool
    
    func resetGame(){
        highestScore = 0
        coins = 100
        playSound(sound: "chimeup", type: "mp3")
    }
    
    var body: some View {
        ZStack{
            // MARK: - BACKGROUND
            Color(red: 0.9882352941, green: 0.7607843137, blue: 0).ignoresSafeArea(.all)
            
            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                
                // MARK: - HEADER
                HeaderView().padding(.top, 50)
                
                HStack{
            
                    //Reset button
                    Button(action: {
                        self.resetGame()
                    }) {
                        Image(systemName: "arrow.2.circlepath.circle")
                            .font(.title)
                            .accentColor(Color.black)
                    }
                    
                    if isChallenging{
                        Text("Challenge Mode On")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("ColorDark"))
                    }
                 
                    //Info button
                    Button(action: {
                        self.showingInfoView = true
                    }) {
                        Image(systemName: "info.circle")
                    }
                        .font(.title)
                        .accentColor(Color.black)
                    
                }//HStack
                
                
                // MARK: - SLOT MACHINE
                SlotMachineView( disableSpin: $disableSpin, showingModal: $showingModal, coins: $coins, highestScore: $highestScore, isChallenging: $isChallenging).padding()
                
                Spacer()
                
            }//VStack
            
            // MARK: - POPUP MODAL
            if self.showingModal{
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
                          Image("rmit-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 70)
                          
                            Text("Bad luck! You lost all of the coins. \n Your highest score is \(highestScore)")
                            .font(.system(.body, design: .rounded))
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.black)
                            .layoutPriority(1)
                            
                            HStack{
                                Spacer()
                                Spacer()
                                TextField("Enter player name", text: $playerName)
                                      .padding(12)
                                      .background(.white)
                                      .foregroundColor(Color("ColorPurple"))
                                      .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                          .stroke()
                                          .fill(.pink))
                                Spacer()
                                Spacer()
                            }
                          
                          Button(action: {
                              self.showingModal = false
                              self.animatingModal = false
                              self.coins = 100
                              self.disableSpin = false
                              
                              //Add player to leaderboard
                              if self.highestScore > 100 {
                                  if playerName != "" {
                                      leaderboardList.append(Player(name: self.playerName, highestScore: self.highestScore))
                                  }else{
                                      leaderboardList.append(Player(name: "???", highestScore: self.highestScore))
                                  }
                              }
                             
                              self.highestScore = 0
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
                        
                    }//VStack
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .top)
                    .background(.white)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color("ColorTransparentBlack").opacity(0.3), radius: 5, x: 0, y: 3)
                    .shadow(color: Color("ColorTransparentBlack").opacity(0.3), radius: 30, x: 0, y: 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    .opacity(animatingModal ? 1 : 0)
                    .offset(y: animatingModal ? 0 : -100)
                    .animation(.spring(response: 0.6, dampingFraction: 0.4, blendDuration: 0.6), value: animatingModal)
                    .onAppear(perform: {
                        self.animatingModal = true
                    })
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
        GameView(isOpen: .constant(false), leaderboardList: .constant([Player(name: "Thinh", highestScore: 999999)]), isChallenging: .constant(true))
            .previewInterfaceOrientation(.portrait)
    }
}
