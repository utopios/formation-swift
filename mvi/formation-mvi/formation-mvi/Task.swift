//
//  Task.swift
//  formation-mvi
//
//  Created by Ihab ABADI on 17/04/2023.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var isFavoris = false
}
