//
//  MorpionModel.swift
//  DemoTest
//
//  Created by Ihab ABADI on 17/05/2023.
//

import Foundation

enum cell: String {
    case x = "X"
    case o = "O"
    case s = ""
}
struct MorpionModel {
    var grid: [cell]
    public init() {
        grid = []
        for _ in 0..<9 {
            grid.append(cell.s)
        }
    }
}
