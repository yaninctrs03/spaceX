//
//  ClipContentView.swift
//  spaceXSUIAppClip
//
//  Created by Yanin Contreras on 01/12/22.
//

import SwiftUI

struct ClipContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClipContentView()
    }
}
