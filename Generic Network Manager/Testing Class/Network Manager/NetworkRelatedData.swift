//
//  NetworkRelatedData.swift
//  Testing Class
//
//  Created by Appaiah on 28/05/21.
//

import Foundation

protocol RequestData {
    var url: String { get }
    var method: String { get }
}

extension RequestData {
     var url: String {
        return "http://www.mocky.io/v2/5dc3f2c13000003c003477a0"
    }
    var method: String {
       return "GET"
   }
}
