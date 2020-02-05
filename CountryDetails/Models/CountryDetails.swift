//
//  CountryDetails.swift
//  CountryDetails
//
//  Created by Hemanth on 27/01/20.
//  Copyright © 2020 Hemanth. All rights reserved.
//

import Foundation
import UIKit

struct CountryDetailsResponse: Decodable {
    var response: CountryDetailsRows
}

struct CountryDetailsRows: Decodable {
    let rows: [CountryDetails]
    let title: String
}

struct CountryDetails: Codable {
    let title: String?
    let description: String?
    let imageHref: String?
    
}
