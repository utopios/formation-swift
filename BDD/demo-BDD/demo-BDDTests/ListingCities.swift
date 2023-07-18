//
//  ListingCities.swift
//  demo-BDDTests
//
//  Created by Ihab ABADI on 18/07/2023.
//

import Foundation
import Quick
import Nimble
import Combine

@testable import demo_BDD

final class ListingCities : QuickSpec {
    override class func spec() {
        //Scenario
        describe("Loading weather forecast of Lille And Paris") {
            //Given
            context("""
                GIVEN the cities Lille and Paris
                AND Weather in Lille is 25
                AND Weather in Paris is 29
                """) {
                //Mock Forecast weather
                let lilleForecast = Forecast(city: "Lille", currentForecast: "sunny", currentTemp: 25)
                let parisForecast = Forecast(city: "Paris", currentForecast: "sunny", currentTemp: 29)
                
                let provider = MockForecastProvider(forecasts: [lilleForecast, parisForecast])
                
                let interactor = ForecastLoadingInteractor(forecastProvider: provider)
                
                var appState = AppState(status: .loadingForecast)
                
                let interactorPerform = interactor.perform(action: .load, in: appState)
                //When
                context("""
                    WHEN Loading successufly cities
                """){
                    
                    _ = interactorPerform.sink(receiveCompletion: {
                        if case .failure(let error ) = $0 {
                            fail("error : \(error)")
                        }}) {
                            appState.forecasts = $0
                            appState.status = .loadedForecasts
                        }
                }
                //Then
                it("""
                    THEN the result should be two cities Lille And Paris
                    """) {
                    expect(appState.status).to(equal(.loadedForecasts))
                    
                    expect(appState.forecasts.count).to(equal(2))
                    
                    
                }
            }
            
        }
    }
}

struct MockForecastProvider : ForecastProvider {
    var forecasts : [Forecast]
    
    func getForecasts() -> AnyPublisher<[Forecast], Error> {
        Future<[Forecast], Error> {$0(.success(self.forecasts))}.eraseToAnyPublisher()
    }
}
