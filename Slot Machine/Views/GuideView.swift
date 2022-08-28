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
            VStack(alignment: .center, spacing: 10) {
                
                // MARK: - HEADER
                Text("GUIDE")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                    
                
                VStack(alignment: .leading, spacing: 20){
                    Text("1. Click the <Spin> button to play").fontWeight(.heavy)
                    
                    Text("2. SMALL WIN: x3 the bet").fontWeight(.heavy)
                    
                    Text("3. BIG WIN: x10 the bet").fontWeight(.heavy)
                    
                    Text("4. Pity system: Every spin give 50% chance to get 1 <PITY POINT>").fontWeight(.heavy)
                    
                    Text("5. 10 <PITY POINT> = 1 BIG WIN").fontWeight(.heavy)
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
                
                
                Spacer()
            }//VStack
            .padding()
            
            
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
