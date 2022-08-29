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
import RiveRuntime
struct MenuView: View {
    // MARK: - PROPERTIES
    @State var selectedMenu: SelectedMenu = .home
    @Binding var menuOption: String
    @Binding var isChallenging: Bool
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")
    
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
                
                VStack{
                    
                    Rectangle()
                        .frame(height:1)
                        .opacity(0.5)
                        .padding(.horizontal)
                    
                    HStack{
                        Toggle("Challenge Mode", isOn: $isChallenging).font(.headline)
                    }.padding()
                    
                    
                        ForEach(menuItems) { item in
                            MenuRow(item: item, selectedMenu: $selectedMenu, menuOption: $menuOption)
                        }
                    

                }
                 .padding(8)
                

                Spacer()
            }//VStack
            .foregroundColor(.white)
            .frame(maxWidth: 288, maxHeight: .infinity)
            .background(Color.black)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
}

struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: RiveViewModel
    var menu: SelectedMenu
}

var menuItems = [
    MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), menu: .home),
    MenuItem(text: "LeaderBoard", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), menu: .leaderBoard),
    MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), menu: .help),
]

enum SelectedMenu: String {
    case home
    case leaderBoard
    case help
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menuOption: .constant("Home"), isChallenging: .constant(false))
    }
}

