//
//  ContentView.swift
//  BindingTest1
//
//  Created by MsMacM on 2023/09/19.
//

import SwiftUI

struct ContentView: View {
//    @State private var secondsF = 10
    @State private var secondR = 10
    @State var isTimer = false
    @State var isTimer2 = false
//    @State private var secondsF2 = 10
    @State private var secondR2 = 10
//2つのタイマーには２種類の変数をBindingで渡すと2つのタイマーとして動く
//    isTimerだけでは2つにならない
    var body: some View {
        VStack {
            BView(secondsRemaining: $secondR, isTimerRunning: $isTimer)
            Button(action: {
                isTimer.toggle()
            }){
                isTimer ? Text("タイマーStop") :  Text("タイマー開始")
            }
            .font(.title)
            BView(secondsRemaining: $secondR2, isTimerRunning: $isTimer2)
            Button(action: {
                isTimer2.toggle()
            }){
                isTimer2 ? Text("タイマーStop") :  Text("タイマー開始")
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
