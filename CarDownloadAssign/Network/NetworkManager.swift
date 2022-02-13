import UIKit

protocol NetworkManagerDelegate
{
    func getData(_ APIData:Data?)
}

class NetworkManager
{
    
    var delegate:NetworkManagerDelegate?
    
    
    func requestNetwork(_ requestUrl:String,_ headers:[String:String]?)
    {
        
        let request = NSMutableURLRequest(url: NSURL(string: requestUrl)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        
        request.httpMethod = "GET"
        if let head = headers{request.allHTTPHeaderFields = head}
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error)->Void in
            if error != nil{
                print(error!)
                return
            }
            
            if let toReturnData = data
            {
                self.delegate?.getData(toReturnData)
                
            }
            
        })
        dataTask.resume()
        
    }
    
    
    func parseJSONArray<T:Decodable>(TData:Data) -> [T]?
    {
        let decoder = JSONDecoder()

        do{
            var decodedData = [T]()
            
            decodedData = try decoder.decode([T].self, from: TData)
            
            
            return decodedData
        }catch{
            print(error)
            
            return nil
        }
    }
}
