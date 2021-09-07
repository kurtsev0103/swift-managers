//  ************************  //
//  ExampleModel.swift        //
//  ------------------------  //
//         Created by         //
//     Oleksandr Kurtsev      //
//  ------------------------  //
//   github:    kurtsev0103   //
//   linkedin:  kurtsev0103   //
//   facebook:  kurtsev0103   //
//  ------------------------  //
//      Copyright © 2021      //
//  ************************  //

import Foundation

struct ExampleModel: Codable {
    let main: Main
    let name: String
}

struct Main: Codable {
    let firstValue: Double
    let secondValue: Double
}
