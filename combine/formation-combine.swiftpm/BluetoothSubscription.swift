//
//  BluetoothSubscription.swift
//  formation-combine
//
//  Created by Ihab ABADI on 05/04/2023.
//

import Foundation
import Combine

class BluetoothSubscription<S: Subscriber>: Subscription where S.Input == BluetoothEvent, S.Failure == Never {
    private let subscriber: S
    private var isConnected: Bool = false

    init(subscriber: S) {
        self.subscriber = subscriber
    }

    func request(_ demand: Subscribers.Demand) {
        // Simule la connexion au dispositif Bluetooth et l'émission d'événements
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            self.isConnected = true
            _ = self.subscriber.receive(.connected)
            
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                let data = Data("Hello from Bluetooth device!".utf8)
                _ = self.subscriber.receive(.dataReceived(data))
                
                DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
                    self.isConnected = false
                    self.subscriber.receive(completion: .finished)
                }
            }
        }
    }

    func cancel() {
        // Gérer la déconnexion du dispositif Bluetooth
        if isConnected {
            isConnected = false
            _ = subscriber.receive(.disconnected)
        }
    }
}
