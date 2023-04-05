import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
        ItemViewList()
    }
    
    func demoBluetoothPublisher() {
        let bluetoothPublisher = BluetoothPublisher()
        
        let cancellable = bluetoothPublisher.sink {
            event in
            switch event {
            case .connected:
                print("Bluetooth c")
            case .disconnected:
                print("Bluetooth d")
            case .dataReceived(let data):
                print(data)
            }
        }
    }
}
