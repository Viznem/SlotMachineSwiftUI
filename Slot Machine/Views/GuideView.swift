/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Truong Thinh
  ID: s3777196
  Created by Thinh, Nguyen Truong on 16/08/2022.
  Last modified: 29/08/2022
  Acknowledgement: https://www.youtube.com/watch?v=h4vyOz4Tztg&t=3589s
*/

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
                    .foregroundColor(Color("ColorDark"))
                
                VStack(alignment: .leading, spacing: 20){
                    Text("1. Click the <Spin> button to play").fontWeight(.heavy).padding(.top, 20)
                    
                    Text("2. SMALL WIN: x2 the bet").fontWeight(.heavy).padding(.top, 20)
                    
                    Text("3. BIG WIN: x10 the bet").fontWeight(.heavy).padding(.top, 20)
                    
                    Text("4. Pity system: Every spin give 50% chance to get 1 <PITY POINT>").fontWeight(.heavy).padding(.top, 20)
                    
                    Text("5. 10 <PITY POINT> = 1 BIG WIN").fontWeight(.heavy).padding(.top, 20)
                    
                    Text("6. Every 10 <PITY POINT> will give 1 KARMA").fontWeight(.heavy).padding(.top, 20)
                    
                    Text("7. The higher the KARMA, the more coins you will lost").fontWeight(.heavy).padding(.top, 20)
                    
                    Text("8. Chellenge Mode: \n *** Lose: - x2 the bet \n *** SMALL WIN: x4 the bet ").fontWeight(.heavy).padding(.top, 20).padding(.bottom, 20)
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .foregroundColor(.yellow)
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(.linearGradient(colors: [.white.opacity(1), .white.opacity(1)], startPoint: .topLeading, endPoint: .bottomTrailing)))
                
                
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
