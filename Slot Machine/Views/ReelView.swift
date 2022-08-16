//
//  ReelView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 16/08/2022.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        ZStack{
            Image("gfx-reel")
              .resizable()
              .scaledToFit()
              .frame(minWidth: 50, idealWidth: 80, maxWidth: 90, minHeight: 55, idealHeight: 75, maxHeight: 85, alignment: .center)
              .shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 6)
            
            Image("gfx-seven")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 50, idealWidth: 80, maxWidth: 90, minHeight: 55, idealHeight: 75, maxHeight: 85, alignment: .center)
                .shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 6)
        }
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView()
    }
}
