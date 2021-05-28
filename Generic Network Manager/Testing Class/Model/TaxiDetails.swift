//
//  TaxiDetails.swift
//  Testing Class
//
//  Created by Appaiah on 28/05/21.
//

import Foundation

struct TaxisDetails: Codable {
    var id: String
    var modelIdentifier: String
    var modelName: String
    var group: String
    var licensePlate: String
    var innerCleanliness: String
    var carImageUrl: String
    var vehicleDetails: VehicleDetails
    var location: Location
}

struct VehicleDetails: Codable  {
    var name: String
    var make: String
    var color: String
    var series: String
    var fuel_type: String
    var fuel_level: Float
    var transmission: String
}

struct Location: Codable  {
    var latitude: Double
    var longitude: Double
}
