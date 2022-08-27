//
//  ContentView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 16/08/2022.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var leaderboardList: [Player] = [Player(name: "Thinh", highestScore: 999999)]
    @State var menuOption: String = "Home"
    @State var isGameView = false
    @State var isOpen = false
    
    let menuButton = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    
    // MARK: - BODY
    var body: some View {
            
            ZStack{
                Color(.black).ignoresSafeArea()
                
                MenuView(menuOption: $menuOption)
                    .opacity(isOpen ? 1 : 0)
                    .offset(x: isOpen ? 0 : -300)
                    .rotation3DEffect(.degrees(isOpen ? 0 : 30), axis: (x: 0, y: -1, z: 0))
                
                switch menuOption{
                case "Home":
                    GameView(isOpen: $isOpen)
                case "LeaderBoard":
                    LeaderBoardView(isOpen: $isOpen, leaderboardList: $leaderboardList)
                case "Help":
                    GuideView(isOpen: $isOpen)
                default:
                    Text("404").foregroundColor(Color.white)
                }
                
        
                //  MENU BUTTON
                menuButton.view()
                    .layoutPriority(1)
                    .frame(width: 35, height: 35)
                    .mask(Circle())
                    .shadow(radius: 5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .onTapGesture {
                        menuButton.setInput("isOpen", value: isOpen)
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                            isOpen.toggle()
                        }
                        
                }
            
        }
    }
}

struct Player: Identifiable {
    let id = UUID()
    let name: String
    let highestScore: Int
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
