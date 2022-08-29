/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Truong Thinh
  ID: s3777196
  Created by Thinh, Nguyen Truong on 16/08/2022.
  Last modified: 29/08/2022
  Acknowledgement: https://www.youtube.com/watch?v=h4vyOz4Tztg&t=3589s
*/

import SwiftUI

struct LeaderBoardView: View {
    @State var isShowing: Bool = false
    @Binding var isOpen: Bool
    @Binding var leaderboardList: [Player]
    
    var body: some View {
        
        // Sort player from higest to lowest score
        let sortedLeaderboard = leaderboardList.sorted(by: {$0.highestScore > $1.highestScore})
        
        ZStack{
            // MARK: - BACKGROUND
            Color(red: 0.9882352941, green: 0.7607843137, blue: 0).ignoresSafeArea(.all)
            
            // MARK: - INTERFACE
            ScrollView{
                VStack(alignment: .center, spacing: 10) {
                    
                    // MARK: - HEADER
                    Text("LEADERBOARD")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                        .padding(.top, 50)
                        .padding(.bottom, 20)
                        .foregroundColor(Color("ColorDark"))
                    
                    
                        ForEach(sortedLeaderboard) {player in

                                VStack{
                                    HStack{
                                        
                                        if player.highestScore == sortedLeaderboard[0].highestScore {
                                            Image("first")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 40, height: 40, alignment: .leading)
                                        }else if player.highestScore == sortedLeaderboard[1].highestScore{
                                            Image("second")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 40, height: 40, alignment: .leading)
                                        }else if player.highestScore == sortedLeaderboard[2].highestScore{
                                            Image("third")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 40, height: 40, alignment: .leading)
                                        }
                                        
                                        
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
                                    }//HStack
                                    
                                    if isShowing {
                                        AchievementView(playerScore: player.highestScore)
                                    }
                                    
                                }//VStack
                                .padding(.vertical, 4)
                                .padding(.horizontal, 16)
                                .frame(minWidth: 128)
                                .background(.black)
                                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .stroke(.linearGradient(colors: [.white.opacity(1), .white.opacity(1)], startPoint: .topLeading, endPoint: .bottomTrailing)))
                                .onTapGesture {
                                    isShowing.toggle()
                                }
                                
                        }
                
                Spacer()
                    
                }//VStack
                .padding()
            }
           
            
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
