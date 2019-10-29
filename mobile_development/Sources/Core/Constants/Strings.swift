// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable file_length
// swiftlint:disable line_length

// swiftlint:disable type_body_length
// swiftlint:disable nesting

enum LocalizedString {
  /// AvailableStorage
  case AboutAvailableStorage
  /// Battery level
  case AboutBatteryLevel
  /// Carrier
  case AboutCarrier
  /// Device name
  case AboutDeviceName
  /// Display diagonal
  case AboutDisplayDiagonal
  ///  GB
  case AboutGB
  /// Low Power mode
  case AboutLowPowerMode
  /// Operationg System
  case AboutOperationSystem
  /// OS version
  case AboutOSVersion
  /// PPI
  case AboutPPI
  /// Screen brightness
  case AboutScreenBrightness
  /// About
  case AboutTitle
  /// Total Storage
  case AboutTotalStorage
  /// unknown
  case AboutUnknown
  /// Device
  case AboutDevice
  /// Accelerometer
  case AccelerometerTitleLabel
  /// X-axis
  case AccelerometerXAxis
  /// Y-axis
  case AccelerometerYAxis
  /// Z-axis
  case AccelerometerZAxis
  /// Calculator
  case CalculatorTitle
  /// Open Photo Library
  case CameraOpenPhotoLibrary
  /// Take Photo
  case CameraTakePhotoButton
  /// Close
  case Close
  /// No
  case CommonNo
  /// Yes
  case CommonYes
  /// Go to Setting and turn on access to Contacts
  case ContactsGoToSettingAndTurnOnAccessToContacts
  /// No access to contacts
  case ContactsNoAccessToContacts
  /// Contacts
  case ContactsTitle
  /// Loading
  case Loading
  /// Login
  case LoginLoginButton
  /// Error
  case MapError
  /// Network error
  case MapNetworkError
  /// Remote server error
  case MapRemoteServerError
  /// Map
  case MapTitle
  /// Unknown error
  case MapUnknownError
  /// Log Out
  case RepositoriesLogOutButton
  /// Sensors
  case SensorsTitle
}

extension LocalizedString: CustomStringConvertible {
  var description: String { return self.string }

  var string: String {
    switch self {
      case .AboutAvailableStorage:
        return LocalizedString.tr("about-Available-Storage")
      case .AboutBatteryLevel:
        return LocalizedString.tr("about-Battery-Level")
      case .AboutCarrier:
        return LocalizedString.tr("about-Carrier")
      case .AboutDeviceName:
        return LocalizedString.tr("about-Device-Name")
      case .AboutDisplayDiagonal:
        return LocalizedString.tr("about-Display-Diagonal")
      case .AboutGB:
        return LocalizedString.tr("about-GB")
      case .AboutLowPowerMode:
        return LocalizedString.tr("about-LowPowerMode")
      case .AboutOperationSystem:
        return LocalizedString.tr("about-Operation-System")
      case .AboutOSVersion:
        return LocalizedString.tr("about-OS-version")
      case .AboutPPI:
        return LocalizedString.tr("about-PPI")
      case .AboutScreenBrightness:
        return LocalizedString.tr("about-Screen-Brightness")
      case .AboutTitle:
        return LocalizedString.tr("about-title")
      case .AboutTotalStorage:
        return LocalizedString.tr("about-Total-Storage")
      case .AboutUnknown:
        return LocalizedString.tr("about-unknown")
      case .AboutDevice:
        return LocalizedString.tr("about–device")
      case .AccelerometerTitleLabel:
        return LocalizedString.tr("accelerometer-title-label")
      case .AccelerometerXAxis:
        return LocalizedString.tr("accelerometer-X-axis")
      case .AccelerometerYAxis:
        return LocalizedString.tr("accelerometer-Y-axis")
      case .AccelerometerZAxis:
        return LocalizedString.tr("accelerometer-Z-axis")
      case .CalculatorTitle:
        return LocalizedString.tr("calculator-title")
      case .CameraOpenPhotoLibrary:
        return LocalizedString.tr("camera-open-photo-library")
      case .CameraTakePhotoButton:
        return LocalizedString.tr("camera-take-photo-button")
      case .Close:
        return LocalizedString.tr("Close")
      case .CommonNo:
        return LocalizedString.tr("common-No")
      case .CommonYes:
        return LocalizedString.tr("common-Yes")
      case .ContactsGoToSettingAndTurnOnAccessToContacts:
        return LocalizedString.tr("contacts-Go-to-Setting-and-turn-on-access-to-Contacts")
      case .ContactsNoAccessToContacts:
        return LocalizedString.tr("contacts-No-access-to-contacts")
      case .ContactsTitle:
        return LocalizedString.tr("contacts-title")
      case .Loading:
        return LocalizedString.tr("Loading")
      case .LoginLoginButton:
        return LocalizedString.tr("login-login-button")
      case .MapError:
        return LocalizedString.tr("map-Error")
      case .MapNetworkError:
        return LocalizedString.tr("map-Network-error")
      case .MapRemoteServerError:
        return LocalizedString.tr("map-Remote-server-error")
      case .MapTitle:
        return LocalizedString.tr("map-title")
      case .MapUnknownError:
        return LocalizedString.tr("map-Unknown-error")
      case .RepositoriesLogOutButton:
        return LocalizedString.tr("repositories-LogOut-button")
      case .SensorsTitle:
        return LocalizedString.tr("sensors-title")
    }
  }

  private static func tr(_ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:enable type_body_length
// swiftlint:enable nesting

func translateFor(key: LocalizedString) -> String {
  return key.string
}

private final class BundleToken {}
