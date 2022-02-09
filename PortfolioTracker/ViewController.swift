//
//  ViewController.swift
//  PortfolioTrecker
//
//  Created by Nataliia Shusta on 07/02/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var marketTableView: UITableView!
    
    var favouritesArray = ["btc","eth","sol"]
    var tableviewArray = [CoinModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        marketTableView.delegate = self
        marketTableView.dataSource = self
        
        NetworkManager.shared.getMarketData { result in
            
            switch result {
                
            case .success(let coinArray):
                self.tableviewArray = coinArray.filter { self.favouritesArray.contains($0.symbol) }
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favouritesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "marketTableVIewCell")
        return  cell!
    }
    
    
    
    
}

