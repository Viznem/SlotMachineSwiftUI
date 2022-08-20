//
//  BetView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 17/08/2022.
//

import SwiftUI

struct BetView: View {
    @Binding var betAmount: Int
    @State var disableMinusButton: Bool = true
    @State var disableAddButton: Bool = false
    
    var body: some View {
        VStack{
            
            HStack{
                Button(action: {
                    if betAmount > 10 {
                        betAmount -= 10
                        disableAddButton = false
                    }else{
                        disableMinusButton = true
                    }
                }){
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.black)
                        .frame(minWidth: 20, idealWidth: 25, maxWidth: 30, minHeight: 20, idealHeight: 25, maxHeight: 30, alignment: .center)
                        .opacity(disableMinusButton ? 0.5 : 1)
                        .shadow(radius: 5)
                }.disabled(disableMinusButton)
                
                HStack {
                  Text("\(betAmount)")
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
                    if betAmount < 30 {
                        betAmount += 10
                        disableMinusButton = false
                    }else{
                        disableAddButton = true
                    }
                }){
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.black)
                        .frame(minWidth: 20, idealWidth: 25, maxWidth: 30, minHeight: 20, idealHeight: 25, maxHeight: 30, alignment: .center)
                        .opacity(disableAddButton ? 0.5 : 1)
                        .shadow(radius: 5)
                }.disabled(disableAddButton)
            }
           
           
            HStack{
                ForEach((1...betAmount/10), id: \.self){ _ in
                    Image("gfx-casino-chips")
                      .resizable()
                      .scaledToFit()
                      .frame(height: 50)
                }
            }.padding()
            
        }
    }
}

struct BetView_Previews: PreviewProvider {
    static var previews: some View {
        BetView(betAmount: .constant(10))
    }
}
