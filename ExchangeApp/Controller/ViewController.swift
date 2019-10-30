//
//  ViewController.swift
//  ExchangeApp
//
//  Created by rau4o on 10/31/19.
//  Copyright © 2019 rau4o. All rights reserved.
//

//import UIKit
//import Moya
//
//class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
//    
//    //MARK: - Properties
//    private let cellId = "cellId"
//    let exchangeProvider = MoyaProvider<ExchnageService>()
//    var exChangeArray = [String]()
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        createCollectionViewController()
//        fetchData()
//        collectionView.anchor(top: view.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0))
//    }
//    
//    //Mark: - Fetch data API with Moya
//    func fetchData() {
//        exchangeProvider.request(.getExchange) { (result) in
//            switch result {
//            case .success(let response):
//                let exchangeData = try! JSONDecoder().decode(Exchange.self, from: response.data)
//                self.title = exchangeData.date
//                let keys = exchangeData.rates.keys.sorted()
//                guard let baseCurrency = exchangeData.base else {return}
//                for i in keys {
//                    guard let value = exchangeData.rates[i] else {return}
//                    print(value)
//                    self.exChangeArray.append("\(baseCurrency) -> \(i) \(value)")
//                    DispatchQueue.main.async {
//                        self.collectionView.reloadData()
//                    }
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//    //MARK: - Setup CollectionView
//    func createCollectionViewController() {
//        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
//           flowLayout.scrollDirection = .vertical
//           flowLayout.minimumLineSpacing = 10
//        }
//        collectionView.register(ExchangeViewCell.self, forCellWithReuseIdentifier: cellId)
//        collectionView.isPagingEnabled = false
//        collectionView.backgroundColor = .white
//        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ExchangeViewCell
//        cell.currencyLabel.text = exChangeArray[indexPath.item]
//        
//        return cell
//        
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 150)
//    }
//    
//    
//}
//
//
//
