//
//  ContentView.swift
//  Shared
//
//  Created by Rob Sturgeon on 01/10/2021.
//

import SwiftUI
import PythonKit

struct ContentView: View {
    let myPythonScript = PythonObject(contentsOfFile: "MyPythonScript")
    @State var name = "CartPole-v0"
  var body: some View {
    VStack {
        Group {
        TextField("CartPole-v0", text: $name)
        Button("Make") {
            myPythonScript.make(name)
        }
        .frame(width: 200, height: 200)
        }
            .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
