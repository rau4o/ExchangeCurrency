//
//  Exchange.swift
//  ExchangeApp
//
//  Created by rau4o on 10/31/19.
//  Copyright © 2019 rau4o. All rights reserved.
//

import UIKit

struct Exchange: Decodable {
    let date: String?
    let base: String?
    let rates: [String: Double]

}
