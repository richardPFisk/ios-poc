//
//  AnimatedProgressBar.swift
//  iosPoc
//
//  Created by Richard Fisk on 15/5/20.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State var progressValue: Float = 0.0
    var newProgressValue: Float?
    
    var body: some View {
        ZStack {
            VStack {
                ProgressBar(progress: self.$progressValue)
                    .frame(width: 100.0, height: 100.0)
                    .padding(40.0)
            }.onAppear {
                let seconds = 1.0
                let progress = self
                let newValue = self.newProgressValue
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    progress.incrementProgress(newValue)
                }
            }
        }
    }

    func incrementProgress(_ value: Float?) {
        if let valueValue = value {
            self.progressValue += valueValue
        }
    }
    
    func incrementProgress() {
        let randomValue = Float([0.012, 0.022, 0.034, 0.016, 0.11].randomElement()!)
        self.progressValue += randomValue
    }
}
