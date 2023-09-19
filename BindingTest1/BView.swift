//
//  BView.swift
//  BindingTest1
//
//  Created by MsMacM on 2023/09/19.
//

import SwiftUI

struct BView: View {
    @Binding var secondsRemaining: Int
    @Binding var secondsFirst: Int
    @Binding var isTimerRunning: Bool
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ProgressView(value: Double(secondsRemaining) / Double(secondsFirst)) { Text("あと\(secondsRemaining)秒") }
            Text("\(secondsRemaining)")
                .font(.largeTitle)
                .onReceive(timer){_ in
                    if isTimerRunning && secondsRemaining > 0{
                        secondsRemaining -= 1
                    } else if secondsRemaining > 0{
                        isTimerRunning = false
                    } else if isTimerRunning {
                        isTimerRunning = false
                    } else {
                        isTimerRunning = false
                        secondsRemaining = secondsFirst
                        //                        secondsRemaining = secondsFirst
                    }
                }
                .onTapGesture {
                    self.isTimerRunning.toggle()
                }
        }
        
    }

}

//struct BView_Previews: PreviewProvider {
//    static var previews: some View {
//        BView()
//    }
//}
