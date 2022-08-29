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

struct SlotMachineView: View {
    // MARK: - PROPERTIES
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    let haptics = UINotificationFeedbackGenerator()
    @State private var reels: Array = [0, 1, 2, 0, 1, 2, 3, 1, 2, 3]
    @State public var betAmount: Int = 10
    @State public var pityCount: Int = 0
    @State private var animatingSymbol: Bool = false
    @State private var karma: Int = 0
    
    @Binding var showingModal: Bool
    @Binding public var coins: Int
    @Binding public var highestScore: Int
    @Binding public var isChallenging: Bool
    
    // MARK: - FUNCTIONS
    
    // Spin
    func spin() {
        if pityCount == 10 {
            reels = reels.map({ _ in
                Int.random(in: 0...0)
            })
            pityCount = 0;
            karma += 1;
        }else{
            reels = reels.map({ _ in
                Int.random(in: 0...symbols.count - 1)
            })
            pityCount += 1;
        }
        playSound(sound: "spin", type: "mp3")
        haptics.notificationOccurred(.success)
    }
    
    // Winning Condition
    func checkWinning() {
        let allValueEqual = reels.dropFirst().allSatisfy({ $0 == reels.first })
        let rowOneEqual = [reels[0],reels[1],reels[2]].elementsEqual(repeatElement(reels[0], count: 3))
        let rowTwoEqual = [reels[3],reels[4],reels[5]].elementsEqual(repeatElement(reels[3], count: 3))
        let rowThreeEqual = [reels[6],reels[7],reels[8]].elementsEqual(repeatElement(reels[6], count: 3))
        
        let collumOneEqual = [reels[0],reels[3],reels[6]].elementsEqual(repeatElement(reels[0], count: 3))
        let collumTwoEqual = [reels[1],reels[4],reels[7]].elementsEqual(repeatElement(reels[1], count: 3))
        let collumThreeEqual = [reels[2],reels[5],reels[8]].elementsEqual(repeatElement(reels[2], count: 3))
        
        if allValueEqual {
            playerWinBig()
            
            if coins > highestScore {
                newHighScore()
            }
        }
        
        if !allValueEqual{
            if rowOneEqual || rowTwoEqual || rowThreeEqual ||
                collumOneEqual || collumTwoEqual || collumThreeEqual
            {
                playerWinSmall()
                
                if coins > highestScore{
                    newHighScore()
                }
            } else {
                playerLoses()
            }
        }
    }

    // Player wins
    func playerWinBig() {
        coins += betAmount * 10
        playSound(sound: "high-score", type: "mp3")
    }
    
    func playerWinSmall() {
        if isChallenging {
            coins += betAmount * 4
        } else {
            coins += betAmount * 2
        }
        
        playSound(sound: "win", type: "mp3")
    }
    
    // New High Score
    func newHighScore() {
        highestScore = coins
    }
    
    // Player loses
    func playerLoses() {
        if isChallenging{
            coins -= betAmount * (2 + karma)
        }else {
            coins -= betAmount * (1 + karma)
        }
        
    }
    
    // Game Over
    func gameOver() {
        if coins <= 0 {
            showingModal = true
            pityCount = 0
            karma = 0
            playSound(sound: "game-over", type: "mp3")
        }
    }
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                // MARK: - SCORE
                ScoreView(coins: $coins, highestScore: $highestScore).padding(.bottom, 20)
                
                // MARK: - REELS
                HStack{
                    ReelView(symbol: $reels[0], animatingSymbol: $animatingSymbol)
                    ReelView(symbol: $reels[1], animatingSymbol: $animatingSymbol)
                    ReelView(symbol: $reels[2], animatingSymbol: $animatingSymbol)
                }
                HStack{
                    ReelView(symbol: $reels[3], animatingSymbol: $animatingSymbol)
                    ReelView(symbol: $reels[4], animatingSymbol: $animatingSymbol)
                    ReelView(symbol: $reels[5], animatingSymbol: $animatingSymbol)
                }
                HStack{
                    ReelView(symbol: $reels[6], animatingSymbol: $animatingSymbol)
                    ReelView(symbol: $reels[7], animatingSymbol: $animatingSymbol)
                    ReelView(symbol: $reels[8], animatingSymbol: $animatingSymbol)
                }
                
                HStack{
                            
                    // MARK: - Bet System
                    BetView(betAmount: $betAmount)
                            
                    Spacer()
                            
                    // SPIN BUTTON
                    Button(action: {
                        // 1. SET DEFAULT STATE: No animation
                        withAnimation{
                            self.animatingSymbol = false
                        }
                        
                        // 2. SPIN will change the symbols
                        self.spin()
                        
                        
                        // 3. Trigger animation after changing symbols
                        withAnimation{
                            self.animatingSymbol = true
                        }
                        
                        // 4.Check winning conditions
                        self.checkWinning()
                        
                        //5. Check gameover
                        self.gameOver()
                        
                    }) {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 100, idealWidth: 160, maxWidth: 180, minHeight: 75, idealHeight: 95, maxHeight: 115, alignment: .center)
                            .shadow(radius: 5)
                    }
                }// HStack
                .padding(.top, 30)
            }
            
        }// ZStack
        
    }
}

struct SlotMachineView_Previews: PreviewProvider {
    static var previews: some View {
        SlotMachineView(showingModal: .constant(true), coins: .constant(100), highestScore: .constant(0), isChallenging: .constant(true))
    }
}
