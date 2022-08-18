//
//  BetView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 17/08/2022.
//

import SwiftUI

struct BetView: View {
    var body: some View {
        VStack{
            
            HStack{
                Button(action: {
                    print("ADD MONEY")
                }){
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.black)
                        .frame(minWidth: 20, idealWidth: 25, maxWidth: 30, minHeight: 20, idealHeight: 25, maxHeight: 30, alignment: .center)
                        .shadow(radius: 5)
                }
                
                HStack {
                  Text("100")
                        .foregroundColor(Color.yellow)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                        .shadow(radius: 5)
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
                .frame(minWidth: 90)
                .background(
                  Capsule()
                    .foregroundColor(Color.black)
                )
                
                Button(action: {
                    print("ADD MONEY")
                }){
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.black)
                        .frame(minWidth: 20, idealWidth: 25, maxWidth: 30, minHeight: 20, idealHeight: 25, maxHeight: 30, alignment: .center)
                        .shadow(radius: 5)
                }
            }
           
           
            HStack{
                Image("gfx-casino-chips")
                  .resizable()
                  .scaledToFit()
                  .frame(height: 50)
                Image("gfx-casino-chips")
                  .resizable()
                  .scaledToFit()
                  .frame(height: 50)
                Image("gfx-casino-chips")
                  .resizable()
                  .scaledToFit()
                  .frame(height: 50)
            }.padding()
            
        }
    }
}

struct BetView_Previews: PreviewProvider {
    static var previews: some View {
        BetView()
    }
}
