//
//  DeviceInfoFactory.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 19/11/2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import CoreTelephony
import DeviceKit

class DeviceInfoModel {
  
  func requestDeviceInfo(completion: @escaping(_ data: [DeviceInformation]?) -> Void) {
    var information: [DeviceInformation] = []
    let device = Device()
    let networkInfo = CTTelephonyNetworkInfo()
    let const = 1073741824.0
    
    let carrier = networkInfo.serviceSubscriberCellularProviders?["0000000100000001"]
    
    information.append(DeviceInformation(specificationName: translateFor(key: .AboutDevice),
                                         value: device.description))
    information.append(DeviceInformation(specificationName: translateFor(key: .AboutDeviceName),
                                         value: device.name))
    information.append(DeviceInformation(specificationName: translateFor(key: .AboutOperationSystem),
                                         value: device.systemName))
    information.append(DeviceInformation(specificationName: translateFor(key: .AboutOSVersion),
                                         value: device.systemVersion))
    information.append(DeviceInformation(specificationName: translateFor(key: .AboutCarrier),
                                         value: carrier?.carrierName ?? translateFor(key: .AboutUnknown)))
    information.append(DeviceInformation(specificationName: translateFor(key: .AboutDisplayDiagonal),
                                         value: String(device.diagonal) + "\""))
    information.append(DeviceInformation(specificationName: translateFor(key: .AboutPPI),
                                         value: String(device.ppi ?? 0)))
    information.append(DeviceInformation(specificationName: translateFor(key: .AboutScreenBrightness),
                                         value: String(device.screenBrightness) + "%"))
    information.append(DeviceInformation(specificationName: translateFor(key: .AboutBatteryLevel),
                                         value: String(device.batteryLevel) + "%"))
    information.append(DeviceInformation(specificationName: translateFor(key: .AboutLowPowerMode),
                                         value: device.batteryState.lowPowerMode ?
                                          translateFor(key: .CommonYes) : translateFor(key: .CommonNo)))
    information.append(DeviceInformation(specificationName: translateFor(key: .AboutTotalStorage),
                                         value: String(format: "%.2f",
                                                       Double(Device.volumeTotalCapacity ?? 0) / const) + translateFor(key: .AboutGB)))
    information.append(DeviceInformation(specificationName: translateFor(key: .AboutAvailableStorage),
                                         value: String(format: "%.2f",
                                                       Double(Device.volumeAvailableCapacity ?? 0) / const) + translateFor(key: .AboutGB)))
    information.append(DeviceInformation(specificationName: "TouchID", value: device.isTouchIDCapable ?
      translateFor(key: .CommonYes) : translateFor(key: .CommonNo)))
    information.append(DeviceInformation(specificationName: "FaceID", value: device.isFaceIDCapable
      ? translateFor(key: .CommonYes) : translateFor(key: .CommonNo)))
    
    completion(information)
  }
  
}
