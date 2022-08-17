//
//  ScoreView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 16/08/2022.
//

import SwiftUI

struct ScoreView: View {
    var body: some View {
        
        HStack{
            HStack {
              Text("Your\nScore".uppercased())
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.trailing)
              
              Text("100")
                    .foregroundColor(Color.yellow)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 3)
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
                
                Text("500")
                      .foregroundColor(Color.yellow)
                      .font(.system(.title, design: .rounded))
                      .fontWeight(.heavy)
                      .shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 3)
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
        ScoreView()
    }
}
