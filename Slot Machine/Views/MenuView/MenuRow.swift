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

struct MenuRow: View {
    // MARK: - PROPERTIES
    var item: MenuItem
    let haptics = UINotificationFeedbackGenerator()
    @Binding var selectedMenu: SelectedMenu
    @Binding var menuOption: String
    
    var body: some View {
        HStack(spacing:14){
            item.icon.view()
                .frame(width: 32, height: 32)
                .opacity(0.6)
            Text(item.text)
                .font(.headline)
        }
         .frame(maxWidth: .infinity, alignment: .leading)
         .padding(12)
         .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.pink)
                .frame(maxWidth: selectedMenu == item.menu ? .infinity : 0)
                .frame(maxWidth: .infinity, alignment: .leading)
         )
         .onTapGesture {
             item.icon.setInput("active", value: true)
             DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                 item.icon.setInput("active", value: false)
             }
             withAnimation(.timingCurve(0.2, 0.8, 0.2, 1)) {
                 selectedMenu = item.menu
                 menuOption = item.text
             }
             playSound(sound: "uwu", type: "mp3")
             haptics.notificationOccurred(.success)
        }
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(item: menuItems[0], selectedMenu: .constant(.home), menuOption: .constant("Home"))
    }
}
