//
//  ViewController.swift
//  Testing Class
//
//  Created by Appaiah on 27/05/21.
//

import UIKit

class ViewController: UIViewController,RequestData {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTaxiList()
    }
    
    /*
        API call - NetworkManager
     */
    func fetchTaxiList()  {
        let manager = NetworkManager()
        manager.networkRequest(url: url, modelType: TaxisDetails.self, sucessData: { data in
            print(data)
        })
    }
}
