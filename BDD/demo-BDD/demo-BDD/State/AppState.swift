//
//  AppState.swift
//  demo-BDD
//
//  Created by Ihab ABADI on 18/07/2023.
//

import Foundation
import Combine

final class AppState : ObservableObject {
    enum Status {
        case loadingForecast
        case loadedForecasts
    }
    
    @Published var status: Status
    @Published var forecasts : [Forecast]
    
    
    init(status: Status, forecasts : [Forecast] = []) {
        self.forecasts = forecasts
        self.status = status
    }
}
