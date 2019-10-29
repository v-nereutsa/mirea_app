//
//  MapViewController.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 14/11/2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit
import YandexMapKitTransport

class MapViewController: UIViewController {
  
  @IBOutlet private var mapView: YMKMapView!
  
  private var masstransitSession: YMKMasstransitSession?
  private let startPoint = MapConstants.startPoint
  private let destinationPoint = MapConstants.destinationPoint
  private let cameraPoint = MapConstants.cameraPoint
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = translateFor(key: .MapTitle)
    
    mapView.mapWindow.map.move(
      with: YMKCameraPosition(target: cameraPoint, zoom: MapConstants.zoom, azimuth: 0, tilt: 0))
    
    let requestPoints : [YMKRequestPoint] = [
      YMKRequestPoint(point: startPoint, arrivalPoints: [], type: .waypoint),
      YMKRequestPoint(point: destinationPoint, arrivalPoints: [], type: .waypoint),
      ]
    let responseHandler = {(routesResponse: [YMKMasstransitRoute]?, error: Error?) -> Void in
      if let routes = routesResponse {
        self.onRoutesReceived(routes)
      } else {
        self.onRoutesError(error!)
      }
    }
    
    
    let masstransitRouter = YMKTransport.sharedInstance()?.createMasstransitRouter()
    masstransitSession = masstransitRouter?.requestRoutes(with: requestPoints,
                                                          masstransitOptions: YMKMasstransitOptions(),
                                                          routeHandler: responseHandler)
  }
  
  private func onRoutesReceived(_ routes: [YMKMasstransitRoute]) {
    let mapObjects = mapView.mapWindow.map.mapObjects
    
    var minTransferCount = routes[0].metadata.weight.transfersCount
    var objectForIndex = 0
    for (index, route) in routes.enumerated() {
      if index == 0 { continue }
      if route.metadata.weight.transfersCount < minTransferCount {
        minTransferCount = route.metadata.weight.transfersCount
        objectForIndex = index
      }
    }
    mapObjects.addPolyline(with: routes[objectForIndex].geometry)
    drawStopPoints(routes[objectForIndex])
  }
  
  private func drawStopPoints(_ route: YMKMasstransitRoute) {
    let mapObjects = mapView.mapWindow.map.mapObjects
    
    let startTransitPoint = YMKPoint(latitude: route.sections[2].stops.first?.position.latitude ?? 0,
                                     longitude: route.sections[2].stops.first?.position.longitude ?? 0)
    let endTransitPoint = YMKPoint(latitude: route.sections[2].stops.last?.position.latitude ?? 0,
                                   longitude: route.sections[2].stops.last?.position.longitude ?? 0)
    
    let circlePoints = [startPoint, startTransitPoint, endTransitPoint, destinationPoint]
    for point in circlePoints {
      let circle = mapObjects.addCircle(
        with: YMKCircle(center: point, radius: MapConstants.circleRadius),
        stroke: .black,
        strokeWidth: MapConstants.strokeWidth,
        fill: .white)
      circle.zIndex = MapConstants.zIndex
    }
  }
  
  
  private func onRoutesError(_ error: Error) {
    let routingError = (error as NSError).userInfo[YRTUnderlyingErrorKey] as! YRTError
    var errorMessage = translateFor(key: .MapUnknownError)
    if routingError.isKind(of: YRTNetworkError.self) {
      errorMessage = translateFor(key: .MapNetworkError)
    } else if routingError.isKind(of: YRTRemoteError.self) {
      errorMessage = translateFor(key: .MapRemoteServerError)
    }
    showOkAlertWith(title: translateFor(key: .MapError), message: errorMessage)
  }
  
}

fileprivate struct MapConstants {
  
  static let startPoint = YMKPoint(latitude: 55.8010208, longitude: 37.805666318323645)
  static let destinationPoint = YMKPoint(latitude: 55.79318405, longitude: 37.70249698399793)
  static let cameraPoint = YMKPoint(latitude: 55.80, longitude: 37.753)
  
  static let zoom: Float = 12
  static let circleRadius: Float = 5
  static let strokeWidth: Float = 2
  static let zIndex: Float = 100
  
  
}
