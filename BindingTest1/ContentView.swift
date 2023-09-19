//
//  ContentView.swift
//  BindingTest1
//
//  Created by MsMacM on 2023/09/19.
//

import SwiftUI

struct ContentView: View {
    @State private var secondsF = 10
    @State private var secondR = 10
    @State var isTimer = false
    
    var body: some View {
        VStack {
            BView(secondsRemaining: $secondR, secondsFirst: $secondsF, isTimerRunning: $isTimer)
            Button(action: {
                isTimer.toggle()
            }){
                isTimer ? Text("タイマーStop") :  Text("タイマー開始")
            }
            .font(.title)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
