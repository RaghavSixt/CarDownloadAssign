//
//  CarAPI.swift
//  SixtCarAssign
//
//  Created by Raghav Saboo on 29/01/22.
//

import Foundation

protocol CarAPIDelegate
{
    func didUpdateInfo(_ carAPIData:[Car])
}

class CarAPI:NetworkManagerDelegate
{
    var delegate: CarAPIDelegate?
    
    let carApiURL = "https://cdn.sixt.io/codingtask/cars"
    
    var networkManager = NetworkManager()
    
    func performRequest()
    {
        
        networkManager.delegate = self
        networkManager.requestNetwork(carApiURL,nil)
    }
    
    func getData(_ APIData: Data?) {
        if let safeData = APIData{
            
            if let decodedData =  self.parseJSON(carData: safeData){
                self.delegate?.didUpdateInfo(decodedData)
            }
        }
    }
    
    
    func parseJSON(carData:Data) -> [Car]?
    {
        return networkManager.parseJSONArray(TData: carData)
    }
    
    
}
