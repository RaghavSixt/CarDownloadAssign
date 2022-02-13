//
//  ViewController.swift
//  CarDownloadAssign
//
//  Created by Raghav Saboo on 13/02/22.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{

    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    let carAPI = CarAPI()
    var carData = [Car]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        
        
        registerCarAPI()
        registerCollectionView()
        view.addSubview(collectionView)
        // Do any additional setup after loading the view.
    }

    
    //Collection View
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func registerCollectionView()
    {
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell
        
        cell?.setCarName(carinfo: carData[ indexPath.row ],indexPath: indexPath)   // To reverse and check from back
        cell?.layer.borderWidth = 0.2
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/2)-3 , height: (view.frame.size.height/6)-3)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
     
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("Seleceted Section \(indexPath.section) and row \(indexPath.row)")
    }
    
    
}


extension ViewController:CarAPIDelegate
{
    func registerCarAPI()
    {
        carAPI.delegate = self
        carAPI.performRequest()
    }
    
    func didUpdateInfo(_ carAPIData:[Car])
    {
        
        DispatchQueue.main.async {
            
         
            
            self.carData = carAPIData
            
//            print(self.carData)
            self.collectionView.reloadData()
        }
        
    }
    

}

