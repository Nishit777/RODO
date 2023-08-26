//
//  ReadJsonData.swift

//
//  Created by NIshit Patel on 8/23/23.
//

import Foundation

class ReadJsonFile
{
    func readLocalFile<T:Decodable>(with name: String, resultType: T.Type) -> T?
    {
        if let url = Bundle.main.url(forResource: name, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                return jsonData
                
            } catch {
                //print("error:\(error)")
            }
        }
        return nil
    }
}
