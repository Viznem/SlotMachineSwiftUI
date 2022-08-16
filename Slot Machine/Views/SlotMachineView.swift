//
//  SlotMachineView.swift
//  Slot Machine
//
//  Created by Thinh, Nguyen Truong on 16/08/2022.
//

import SwiftUI

struct SlotMachineView: View {
    var body: some View {
        VStack{
            HStack{
                ReelView()
                ReelView()
                ReelView()
            }
            HStack{
                ReelView()
                ReelView()
                ReelView()
            }
            HStack{
                ReelView()
                ReelView()
                ReelView()
            }
        }
    }
}

struct SlotMachineView_Previews: PreviewProvider {
    static var previews: some View {
        SlotMachineView()
    }
}
