//
//  ReelView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 16/08/2022.
//

import SwiftUI

struct ReelView: View {
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    @Binding var symbol: Int
    
    var body: some View {
        
        ZStack{
            Image("gfx-reel")
              .resizable()
              .scaledToFit()
              .frame(minWidth: 50, idealWidth: 80, maxWidth: 90, minHeight: 55, idealHeight: 75, maxHeight: 85, alignment: .center)
              .shadow(radius: 5)
            Image(symbols[symbol])
                .resizable()
                .scaledToFit()
                .frame(minWidth: 50, idealWidth: 80, maxWidth: 90, minHeight: 55, idealHeight: 75, maxHeight: 85, alignment: .center)
                .shadow(radius: 5)
        }
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView(symbol: .constant(0))
    }
}
