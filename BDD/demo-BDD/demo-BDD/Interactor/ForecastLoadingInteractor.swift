//
//  ForecastLoadingInteractor.swift
//  demo-BDD
//
//  Created by Ihab ABADI on 18/07/2023.
//

import Foundation

import Combine

protocol ForecastProvider {
    func getForecasts() -> AnyPublisher<[Forecast], Error>
}

struct ForecastLoadingInteractor {
    var forecastProvider : ForecastProvider
    
    enum Action {
        case load
    }
    
    func perform(action: Action, in: AppState) -> AnyPublisher<[Forecast], Error> {
        forecastProvider.getForecasts().eraseToAnyPublisher()
    }
    
}
