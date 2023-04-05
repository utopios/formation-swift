//
//  BluetoothPublisher.swift
//  formation-combine
//
//  Created by Ihab ABADI on 05/04/2023.
//

import Foundation
import Combine

enum BluetoothEvent {
    case connected
    case disconnected
    case dataReceived(Data)
}


struct BluetoothPublisher: Publisher {
    typealias Output = BluetoothEvent
    typealias Failure = Never

    func receive<S>(subscriber: S) where S: Subscriber, BluetoothPublisher.Failure == S.Failure, BluetoothPublisher.Output == S.Input {
        let subscription = BluetoothSubscription(subscriber: subscriber)
        subscriber.receive(subscription: subscription)
    }
}
