//
//  ViewModel.swift
//  MagneticTestBulgakov
//
//  Created by Dima on 21.04.2024.
//

import UIKit

final class ResultDevicesViewModel {
    
    // MARK: - Properties
    var devices: [DeviceModel] = []
    var numberOfDevices: Int {
        return devices.count
    }

    // MARK: - Methods
    func device(at index: Int) -> DeviceModel? {
        guard index >= 0 && index < devices.count else { return nil }
        return devices[index]
    }
    
    func loadDevices() {
        devices = [
            DeviceModel(name: "-",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            
            DeviceModel(name: "MacTick-a123",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: false),
            
            DeviceModel(name: "Phone",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            
            DeviceModel(name: "Ms_12k",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: false),
            
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
            DeviceModel(name: "Router Traplun",
                        ipAddress: "192.168.1.2",
                        connectionType: "Wifi",
                        hostName: "gwpc-21141234.local",
                        isSuccessfulConnection: true),
        ]
    }
}
