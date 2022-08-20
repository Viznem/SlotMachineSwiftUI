//
//  ScoreView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 16/08/2022.
//

import SwiftUI

struct ScoreView: View {
    @Binding var coins: Int
    @Binding var highestScore: Int
    
    var body: some View {
        
        HStack{
            HStack {
              Text("Your\nScore".uppercased())
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.trailing)
              
              Text("\(coins)")
                    .foregroundColor(Color.yellow)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .shadow(radius: 5)
                    .layoutPriority(1)
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            .frame(minWidth: 128)
            .background(
              Capsule()
                .foregroundColor(Color.black)
            )
            
            Spacer()
            
            HStack {
                
              Text("\(highestScore)")
                      .foregroundColor(Color.yellow)
                      .font(.system(.title, design: .rounded))
                      .fontWeight(.heavy)
                      .shadow(radius: 5)
                      .layoutPriority(1)
                
              Text("Highest\nScore".uppercased())
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.trailing)
              
              
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            .frame(minWidth: 128)
            .background(
              Capsule()
                .foregroundColor(Color.black)
            )
        }

    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(coins: .constant(100), highestScore: .constant(0))
    }
}
