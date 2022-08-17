//
//  MenuView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 17/08/2022.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack{
            HStack{
                Image("rmit-casino-logo-blue-bg")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .mask(Circle())
                
                VStack(alignment: .leading, spacing: 2){
                    Text("RMIT CASINO")
                        .font(.body)
                        .bold()
                    Text("Win big or Lose all")
                        .font(.subheadline)
                        .opacity(0.7)
                }
                Spacer()
                
            }//HStack
            .padding()
            Spacer()
            
        }//VStack
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color.black)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
