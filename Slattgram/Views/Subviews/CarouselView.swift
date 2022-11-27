//
//  CarouselView.swift
//  DogGram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct CarouselView: View {
    @State private var selection = 1
    @State private var timerAdded = false
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(1..<8) { count in
                Image("dog\(count)")
                    .resizable()
                    .scaledToFill()
                    .tag(count)
            }
        }
        .tabViewStyle(.page)
        .frame(height: 300)
        .animation(.default, value: selection)
        .onAppear {
            if !timerAdded {
                addTimer()
            }
        }
    }
    
    func addTimer() {
        timerAdded = true
        
        let timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            if selection == 7 {
                selection = 1
            } else {
                selection +=  1
            }
        }
        
        timer.fire()
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
            .previewLayout(.sizeThatFits)
    }
}
