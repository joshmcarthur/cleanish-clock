//
//  ContentView.swift
//  Cleanish Clock
//
//  Created by Josh McArthur on 23/12/20.
//

import SwiftUI

struct ContentView: View {
    @State var formattedTime = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var dateFormatter = DateFormatter();

    init() {
        self.dateFormatter.dateFormat = "HH:mm"
    }
    
    var body: some View {
        ZStack {
            Text("\(self.formattedTime)").tracking(-1.5)
                .onReceive(timer) { input in
                    self.formattedTime = self.dateFormatter.string(from: input)
                }
                .font(.system(size: 96,  weight: .semibold, design: .rounded))
                .foregroundColor(Color(UIColor.label))
                .padding()
        }
        .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
