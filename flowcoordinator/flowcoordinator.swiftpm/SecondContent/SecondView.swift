//
//  File.swift
//  
//
//  Created by Ihab ABADI on 11/04/2023.
//

import Foundation
import SwiftUI

struct SecondView : View {
    var data:String?
    
    init(_ d:String?) {
        data = d
    }
    var body: some View {
        VStack {
            Text(data ?? "")
        }
    }
}
