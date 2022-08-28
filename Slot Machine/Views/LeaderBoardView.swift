//
//  LeaderBoardView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 19/08/2022.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var isOpen: Bool
    @Binding var leaderboardList: [Player]
    
    var body: some View {
        let sortedLeaderboard = leaderboardList.sorted(by: {$0.highestScore > $1.highestScore})
        ZStack{
            // MARK: - BACKGROUND
            Color(red: 0.9882352941, green: 0.7607843137, blue: 0).ignoresSafeArea(.all)
            
            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 10) {
                
                // MARK: - HEADER
                Text("LEADERBOARD")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                
                ForEach(sortedLeaderboard) {player in
                    HStack{
                        Spacer()
                        Text(player.name)
                            .foregroundColor(Color.yellow)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .shadow(radius: 5)
                        
                        Spacer()
                        
                        Text("\(player.highestScore)")
                            .foregroundColor(Color.yellow)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .shadow(radius: 5)
                        Spacer()
                    }
                    .padding(.vertical, 4)
                    .padding(.horizontal, 16)
                    .frame(minWidth: 128)
                    .background(
                        Capsule()
                        .foregroundColor(Color.black)
                    )
                }
               
            Spacer()
            }//VStack
            .padding()
            
            
        }//ZStack
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .rotation3DEffect(.degrees(isOpen ? 30: 0), axis: (x: 0, y: -1, z: 0))
        .offset(x: isOpen ? 265 : 0)
        .scaleEffect(isOpen ? 0.9 : 1)
        .ignoresSafeArea()
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView(isOpen: .constant(false), leaderboardList: .constant([Player(name: "Thinh", highestScore: 999999)]))
    }
}
