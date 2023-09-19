//
//  BView.swift
//  BindingTest1
//
//  Created by MsMacM on 2023/09/19.
//

import SwiftUI

struct BView: View {
    @Binding var secondsRemaining: Int
    
    @Binding var isTimerRunning: Bool
    @State var secondsFirst = 10
    //    コンピューテッドプロパティでsecondsFirstを作る
//    var secondsFirst: Int {
//        secondsRemaining
//    }
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ProgressView(value: Double(secondsRemaining) / Double(secondsFirst)) { Text("あと\(secondsRemaining)秒") }
            Text("\(secondsRemaining)")
                .font(.largeTitle)
//            下の条件式がうまく動かない。カウンターが最初に戻らない。デバッガーを使う必要がある。230921
                .onReceive(timer){_ in
                    if isTimerRunning && secondsRemaining > 0 {
                        secondsRemaining -= 1
                    } else if isTimerRunning {
                        isTimerRunning = false
                        secondsRemaining = secondsFirst
                    } else if secondsRemaining > 0 {
                        isTimerRunning = false
                    } else {
//                        ここは来ない
                        isTimerRunning = false
                        secondsRemaining = secondsFirst
                    }
                }
                .onTapGesture {
                    self.isTimerRunning.toggle()
                }
        }
//        表示された時にsecondsFirstとして最初の値を取っておく
        .onAppear {
            secondsFirst = secondsRemaining
        }
        
    }
    
}

//struct BView_Previews: PreviewProvider {
//    static var previews: some View {
//        BView()
//    }
//}
