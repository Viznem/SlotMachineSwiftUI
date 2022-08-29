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
*/

import SwiftUI

struct AchievementView: View {
    @State var playerScore: Int
    var body: some View {
        
        VStack{
            if playerScore >= 10000{
                HStack{
                    Image("10k-points")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("God of Casino")
                        .foregroundColor(Color.yellow)
                        .fontWeight(.heavy)
                }
                
            } else if playerScore >= 1000{
                HStack{
                    Image("1k-points")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .leading)
                    
                    Text("Rich never this easy")
                        .foregroundColor(Color.yellow)
                        .fontWeight(.heavy)
                }
            }  else if playerScore >= 500 {
                HStack{
                    Image("500-points")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .leading)
                    Text("I can feel the luck")
                        .foregroundColor(Color.yellow)
                        .fontWeight(.heavy)
                }
            } else if playerScore >= 200 {
                HStack{
                    Image("200-points")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .leading)
                    Text("More than a peasant")
                        .foregroundColor(Color.yellow)
                        .fontWeight(.heavy)
                }
            } else {
                Text("No Cool Achievement")
                    .foregroundColor(Color.yellow)
                    .fontWeight(.heavy)
            }
        }//VStack
    }
}

struct AchievementView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView(playerScore: 10000)
    }
}
