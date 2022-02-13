//
//  File.swift
//  SixtCarAssign
//
//  Created by Raghav Saboo on 29/01/22.
//

import Foundation

import Foundation

struct Car:Decodable
{
    let id:String
    let name:String
    let make:String
    let carImageUrl:String
    let color:String
    let fuelType:String
    let series:String
    let latitude:Double
    let longitude:Double
}
