//
//  ApiNetwork.swift
//  gitIos
//
//  Created by Danilo Osorio on 16/01/25.
//

import Foundation

class ApiNetwork{
    
    struct Wrapper:Codable{
        let response:String
        let results:[SuperHero]
    }
    struct ImageSuperHero:Codable {
        let url:String
    }
    
    struct SuperHero:Codable,Identifiable {
        let id:String
        let name:String
        let image: ImageSuperHero
    }
    //superhero complete
    struct SuperheroCompleted:Codable{
        let id:String
        let name:String
        let image:ImageSuperHero
        let powerstats:Powerstats
        let biography:Biography
    }
    
    struct Powerstats:Codable {
        let intelligence :String
        let strength:String
        let speed:String
        let durability: String
        let power: String
        let combat:String
    }
    
    struct Biography:Codable {
        let alignment:String
        let publisher:String
        let aliases: [String]
        let fullName: String
        
        enum CodingKeys:String,CodingKey{
            case alignment = "alignment"
            case publisher = "publisher"
            case aliases = "aliases"
            case fullName = "full-name"
        }
    }
    
    func getHerosByQuery(query:String) async throws ->Wrapper{
        let url = URL(string: "https://superheroapi.com/api/a574a6135aa556611c21152b9c9a2c51/search/\(query)")!
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
    
    func getHeroById(id:String) async throws -> SuperheroCompleted{
        let url = URL(string: "https://superheroapi.com/api/a574a6135aa556611c21152b9c9a2c51/\(id)")!
    
        let (data, _ ) = try await URLSession.shared.data(from: url)

        let superhero = try JSONDecoder().decode(SuperheroCompleted.self, from: data)
        return superhero
    }
    
}
