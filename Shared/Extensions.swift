//
//  Extensions.swift
//  PythonPractice (macOS)
//
//  Created by Rob Sturgeon on 01/10/2021.
//

import PythonKit
import Foundation

extension PythonObject {
  static func loadPythonScript(named filename: String) -> PythonObject {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "py")?
            .deletingLastPathComponent() else {
      fatalError("Could not get URL for file")
    }
    let sys = Python.import("sys")
    let gym = Python.import("gym")
    let path = PythonObject(url.path)
    if !(sys.path.contains(path)) {
      sys.path.append(path)
    }
    return Python.import(filename)
  }
  
  init(contentsOfFile filename: String) {
    self.init(Self.loadPythonScript(named: filename))
  }
}
