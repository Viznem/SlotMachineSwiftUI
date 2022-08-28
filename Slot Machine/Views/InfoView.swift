//
//  InfoView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 17/08/2022.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
      VStack(alignment: .center, spacing: 10) {
        Image("rmit-casino-logo-blue-bg")
              .resizable()
              .scaledToFit()
              .frame(minWidth: 256, idealWidth: 300, maxWidth: 320, minHeight: 112, idealHeight: 130, maxHeight: 140, alignment: .center)
              .padding(.horizontal)
              .shadow(color: Color("ColorTransparentBlack"), radius: 5, x: 0, y: 6)
              .mask(Circle())
        
        Spacer()
        
        Form {
          Section(header: Text("About the application")) {
            FormRowView(firstItem: "Application", secondItem: "RMIT CASINO")
            FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
            FormRowView(firstItem: "Developer", secondItem: "Thinh")
            FormRowView(firstItem: "Designer", secondItem: "Thinh")
            FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
            FormRowView(firstItem: "Copyright", secondItem: "© All rights reserved.")
            FormRowView(firstItem: "Version", secondItem: "1.0.0")
          }
        }
        .font(.system(.body, design: .rounded))
      }
      .padding(.top, 40)
      .overlay(
        Button(action: {
            audioPlayer?.stop()
          self.presentationMode.wrappedValue.dismiss()
        }) {
          Image(systemName: "xmark.circle")
            .font(.title)
        }
        .padding(.top, 30)
        .padding(.trailing, 20)
        .accentColor(Color.secondary)
        , alignment: .topTrailing
      )
      .onAppear {
          playSound(sound: "menu-background-music", type: "mp3")
      }
    }
  }

  struct FormRowView: View {
    var firstItem: String
    var secondItem: String
    
    var body: some View {
      HStack {
        Text(firstItem).foregroundColor(Color.gray)
        Spacer()
        Text(secondItem)
      }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
