//
//  SlotMachineView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 16/08/2022.
//

import SwiftUI

struct SlotMachineView: View {
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    @State private var reels: Array = [0, 1, 2, 0, 1, 2, 3, 1, 2, 3]
    @State public var highestScore: Int = 0
    @State public var betAmount: Int = 10
    @State public var pityCount: Int = 0
    
    @Binding var showingModal: Bool
    @Binding public var coins: Int

    
    // MARK: - FUNCTIONS
    
    // Spin
    func spin() {
        if pityCount == 10 {
            reels = reels.map({ _ in
                Int.random(in: 0...0)
            })
            pityCount = 0;
        }else{
            reels = reels.map({ _ in
                Int.random(in: 0...symbols.count - 1)
            })
            pityCount += 1;
        }
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
    }
    
    func playerWinSmall() {
        coins += betAmount * 3
    }
    
    // New High Score
    func newHighScore() {
        highestScore = coins
    }
    
    // Player loses
    func playerLoses() {
        coins -= betAmount * 2
    }
    
    // Game Over
    func gameOver() {
        if coins <= 0 {
            showingModal = true
            pityCount = 0
        }
    }
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                // MARK: - SCORE
                ScoreView(coins: $coins, highestScore: $highestScore).padding(.bottom, 20)
                
                HStack{
                    ReelView(symbol: $reels[0])
                    ReelView(symbol: $reels[1])
                    ReelView(symbol: $reels[2])
                }
                HStack{
                    ReelView(symbol: $reels[3])
                    ReelView(symbol: $reels[4])
                    ReelView(symbol: $reels[5])
                }
                HStack{
                    ReelView(symbol: $reels[6])
                    ReelView(symbol: $reels[7])
                    ReelView(symbol: $reels[8])
                }
                
                HStack{
                            
                    // MARK: - Bet System
                    BetView(betAmount: $betAmount)
                            
                    Spacer()
                            
                    // SPIN BUTTON
                    Button(action: {
                        self.gameOver()
                        
                        self.spin()
                        
                        self.checkWinning()
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
        SlotMachineView(showingModal: .constant(true), coins: .constant(100))
    }
}
