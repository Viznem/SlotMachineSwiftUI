//
//  GuideView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 19/08/2022.
//

import SwiftUI

struct GuideView: View {
    @Binding var isOpen: Bool
    
    var body: some View {
        
        ZStack{
            // MARK: - BACKGROUND
            Color(red: 0.9882352941, green: 0.7607843137, blue: 0).ignoresSafeArea(.all)
            
            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                
                // MARK: - HEADER
                Text("GUIDE").font(.headline)
            
            }//VStack
            
            
        }//ZStack
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .rotation3DEffect(.degrees(isOpen ? 30: 0), axis: (x: 0, y: -1, z: 0))
        .offset(x: isOpen ? 265 : 0)
        .scaleEffect(isOpen ? 0.9 : 1)
        .ignoresSafeArea()
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView(isOpen: .constant(false))
    }
}
