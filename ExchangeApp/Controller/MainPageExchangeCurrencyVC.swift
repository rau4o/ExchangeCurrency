//
//  MainPageExchangeCurrencyVC.swift
//  ExchangeApp
//
//  Created by rau4o on 10/31/19.
//  Copyright © 2019 rau4o. All rights reserved.
//

import UIKit
import Moya

class MainPageExchangeCurrencyVC: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    //MARK: - Properties
    private let cellId = "cellId"
    let exchangeProvider = MoyaProvider<ExchnageService>()
    var exChangeArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCollectionViewController()
        fetchData()
    }
    
    //Mark: - Fetch data API with Moya
    func fetchData() {
        exchangeProvider.request(.getExchange) { (result) in
            switch result {
            case .success(let response):
                let exchangeData = try! JSONDecoder().decode(Exchange.self, from: response.data)
                self.title = exchangeData.date
                let keys = exchangeData.rates.keys.sorted()
                guard let baseCurrency = exchangeData.base else {return}
                for i in keys {
                    guard let value = exchangeData.rates[i] else {return}
                    print(value)
                    self.exChangeArray.append("1\(baseCurrency) -> \(i) \(value)")
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - Setup CollectionView
    func createCollectionViewController() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
           flowLayout.scrollDirection = .vertical
           flowLayout.minimumLineSpacing = 10
        }
        collectionView.register(ExchangeViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .gray
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exChangeArray.count
       }
       
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ExchangeViewCell
        cell.currencyLabel.text = exChangeArray[indexPath.item]
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
           
        return cell
           
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 30, height: 150)
    }
}


