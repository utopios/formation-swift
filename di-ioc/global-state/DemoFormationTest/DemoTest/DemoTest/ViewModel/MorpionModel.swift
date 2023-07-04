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
    private var _grid: [cell]
    public init() {
        _grid = []
        for _ in 0..<9 {
            _grid.append(cell.s)
        }
    }
    
    var grid: [cell] {
        get {_grid}
    }
    
    public mutating func setCell(n:Int, c:cell) -> Bool {
        guard grid.indices.contains(n) else {
            return false
        }
        guard grid[n] == .s else {
            return false
        }
        _grid[n] = c
        return true
    }
}
