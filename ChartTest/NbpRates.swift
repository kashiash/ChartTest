//
//  NbpRates.swift
//  ChartTest
//
//  Created by Jacek Kosinski U on 11/01/2024.
//

import Foundation


extension DateFormatter {

    static let jsonNbp: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
}

struct NbpRates: Decodable ,Identifiable  {
    var id: String?
    var effectiveDate: Date
    var mid: Double

    enum CodingKeys: String ,CodingKey {
        case id = "no"
        case effectiveDate
        case mid
    }


    static let data =    """
    [{"no":"209/A/NBP/2023","effectiveDate":"2023-10-27","mid":4.2267},
    {"no":"210/A/NBP/2023","effectiveDate":"2023-10-30","mid":4.2040},
    {"no":"211/A/NBP/2023","effectiveDate":"2023-10-31","mid":4.1684},
    {"no":"212/A/NBP/2023","effectiveDate":"2023-11-02","mid":4.1963},
    {"no":"213/A/NBP/2023","effectiveDate":"2023-11-03","mid":4.1857},
    {"no":"214/A/NBP/2023","effectiveDate":"2023-11-06","mid":4.1512},
    {"no":"215/A/NBP/2023","effectiveDate":"2023-11-07","mid":4.1667},
    {"no":"216/A/NBP/2023","effectiveDate":"2023-11-08","mid":4.1804},
    {"no":"217/A/NBP/2023","effectiveDate":"2023-11-09","mid":4.1513},
    {"no":"218/A/NBP/2023","effectiveDate":"2023-11-10","mid":4.1423},
    {"no":"219/A/NBP/2023","effectiveDate":"2023-11-13","mid":4.1474},
    {"no":"220/A/NBP/2023","effectiveDate":"2023-11-14","mid":4.1210},
    {"no":"221/A/NBP/2023","effectiveDate":"2023-11-15","mid":4.0453},
    {"no":"222/A/NBP/2023","effectiveDate":"2023-11-16","mid":4.0415},
    {"no":"223/A/NBP/2023","effectiveDate":"2023-11-17","mid":4.0327},
    {"no":"224/A/NBP/2023","effectiveDate":"2023-11-20","mid":3.9938},
    {"no":"225/A/NBP/2023","effectiveDate":"2023-11-21","mid":3.9882},
    {"no":"226/A/NBP/2023","effectiveDate":"2023-11-22","mid":4.0180},
    {"no":"227/A/NBP/2023","effectiveDate":"2023-11-23","mid":3.9969},
    {"no":"228/A/NBP/2023","effectiveDate":"2023-11-24","mid":4.0103},
    {"no":"229/A/NBP/2023","effectiveDate":"2023-11-27","mid":3.9769},
    {"no":"230/A/NBP/2023","effectiveDate":"2023-11-28","mid":3.9750},
    {"no":"231/A/NBP/2023","effectiveDate":"2023-11-29","mid":3.9478},
    {"no":"232/A/NBP/2023","effectiveDate":"2023-11-30","mid":3.9810},
    {"no":"233/A/NBP/2023","effectiveDate":"2023-12-01","mid":3.9910},
    {"no":"234/A/NBP/2023","effectiveDate":"2023-12-04","mid":3.9850},
    {"no":"235/A/NBP/2023","effectiveDate":"2023-12-05","mid":3.9910},
    {"no":"236/A/NBP/2023","effectiveDate":"2023-12-06","mid":4.0202},
    {"no":"237/A/NBP/2023","effectiveDate":"2023-12-07","mid":4.0199},
    {"no":"238/A/NBP/2023","effectiveDate":"2023-12-08","mid":4.0181},
    {"no":"239/A/NBP/2023","effectiveDate":"2023-12-11","mid":4.0277},
    {"no":"240/A/NBP/2023","effectiveDate":"2023-12-12","mid":4.0204},
    {"no":"241/A/NBP/2023","effectiveDate":"2023-12-13","mid":4.0149},
    {"no":"242/A/NBP/2023","effectiveDate":"2023-12-14","mid":3.9484},
    {"no":"243/A/NBP/2023","effectiveDate":"2023-12-15","mid":3.9326},
    {"no":"244/A/NBP/2023","effectiveDate":"2023-12-18","mid":3.9625},
    {"no":"245/A/NBP/2023","effectiveDate":"2023-12-19","mid":3.9591},
    {"no":"246/A/NBP/2023","effectiveDate":"2023-12-20","mid":3.9527},
    {"no":"247/A/NBP/2023","effectiveDate":"2023-12-21","mid":3.9645},
    {"no":"248/A/NBP/2023","effectiveDate":"2023-12-22","mid":3.9338},
    {"no":"249/A/NBP/2023","effectiveDate":"2023-12-27","mid":3.9178},
    {"no":"250/A/NBP/2023","effectiveDate":"2023-12-28","mid":3.8990},
    {"no":"251/A/NBP/2023","effectiveDate":"2023-12-29","mid":3.9350},
    {"no":"001/A/NBP/2024","effectiveDate":"2024-01-02","mid":3.9432},
    {"no":"002/A/NBP/2024","effectiveDate":"2024-01-03","mid":3.9909},
    {"no":"003/A/NBP/2024","effectiveDate":"2024-01-04","mid":3.9684},
    {"no":"004/A/NBP/2024","effectiveDate":"2024-01-05","mid":3.9850},
    {"no":"005/A/NBP/2024","effectiveDate":"2024-01-08","mid":3.9812},
    {"no":"006/A/NBP/2024","effectiveDate":"2024-01-09","mid":3.9612},
    {"no":"007/A/NBP/2024","effectiveDate":"2024-01-10","mid":3.9656}]
    """.data(using: .utf8)!
}
