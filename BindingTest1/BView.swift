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
                    if self.isTimerRunning && self.secondsRemaining > 0{
                        self.secondsRemaining -= 1
                    } else if self.secondsRemaining > 0{
                        self.isTimerRunning = false
                    } else if self.isTimerRunning {
                        self.isTimerRunning = false
                    } else {
                        self.isTimerRunning = false                    
                        self.secondsRemaining = self.secondsFirst
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
