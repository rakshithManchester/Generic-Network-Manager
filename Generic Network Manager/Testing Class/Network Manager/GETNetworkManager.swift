//
//  GETNetworkManager.swift
//  Testing Class
//
//  Created by Appaiah on 28/05/21.
//

import Foundation

class NetworkManager {
    
    /*
     Network Request :
     a) url: "http://www.mocky.io/v2/5dc3f2c13000003c003477a0"
     b) modelType: T.Type
     c) sucessData: ([T]) -> ())
     */
    func networkRequest<T: Codable>(url: String, modelType: T.Type, sucessData: @escaping ([T]) -> ()) {
        URLSession.shared.dataTask(with: URL(string: url)!) { (data,response,error ) in
            
            self.responseHandler(_data: data, _response: response, type: TaxisDetails.self,
                                 success: {
                                    data in
                                    if let _sucessData = data as? [T] {
                                        sucessData(_sucessData)
                                    }
                                 }, failure: {
                                    eror in
                                    print(error?.localizedDescription ?? "Failure Error")
                                 })}.resume()
        
    }
    
    /*
     Network Request :
     a) _data: Data
     b) _response: URLResponse
     c) sucess: ([T]) -> ()
     d) failure: (DecodingError) -> ()
     */
    
    func responseHandler<T: Codable>(_data: Data?, _response: URLResponse?, type: T.Type?, success: ([T]) -> (), failure: (DecodingError) -> ()) {
        do {
            if let data = _data {
                let decoder = JSONDecoder()
                do {
                    let taxitaxi = try decoder.decode([T].self , from: data)
                    success(taxitaxi)   // Success Call back
                } catch let error {
                    guard let _error = error as? DecodingError  else {
                        return
                    }
                    failure(_error)     // Failure Call back
                    switch _error {
                    case .typeMismatch(let key, let value):
                        print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .valueNotFound(let key, let value):
                        print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .keyNotFound(let key, let value):
                        print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
                    case .dataCorrupted(let key):
                        print("error \(key), and ERROR: \(error.localizedDescription)")
                    default:
                        print("ERROR: \(error.localizedDescription)")
                    }                }
            }
        }
    }
}
