//
//  Item.swift
//  ChartTest
//
//  Created by Jacek Kosinski U on 11/01/2024.
//

import Foundation

struct Consumption: Codable, Identifiable {
    let id: String
    let from: Date
    let to: Date
    let cost: Double
    let consumption: Double
    let consumptionUnit: String
    let currency: String

    static let data = """
    [{"id":"1","from":"2023-02-12T00:00:00.000+01:00","to":"2023-02-12T01:00:00.000+01:00","cost":2.768758875,"consumption":2.817,"consumptionUnit":"kWh","currency":"SEK"},{"id":"2","from":"2023-02-12T01:00:00.000+01:00","to":"2023-02-12T02:00:00.000+01:00","cost":49.00516435,"consumption":10.794,"consumptionUnit":"kWh","currency":"SEK"},{"id":"3","from":"2023-02-12T02:00:00.000+01:00","to":"2023-02-12T03:00:00.000+01:00","cost":47.8345572125,"consumption":9.967,"consumptionUnit":"kWh","currency":"SEK"},{"id":"4","from":"2023-02-12T03:00:00.000+01:00","to":"2023-02-12T04:00:00.000+01:00","cost":48.62424185,"consumption":10.026,"consumptionUnit":"kWh","currency":"SEK"},{"id":"5","from":"2023-02-12T04:00:00.000+01:00","to":"2023-02-12T05:00:00.000+01:00","cost":46.695987275,"consumption":10.619,"consumptionUnit":"kWh","currency":"SEK"},{"id":"6","from":"2023-02-12T05:00:00.000+01:00","to":"2023-02-12T06:00:00.000+01:00","cost":50.915838875,"consumption":11.201,"consumptionUnit":"kWh","currency":"SEK"},{"id":"7","from":"2023-02-12T06:00:00.000+01:00","to":"2023-02-12T07:00:00.000+01:00","cost":52.9999920625,"consumption":11.317,"consumptionUnit":"kWh","currency":"SEK"},{"id":"8","from":"2023-02-12T07:00:00.000+01:00","to":"2023-02-12T08:00:00.000+01:00","cost":42.7862852,"consumption":10.698,"consumptionUnit":"kWh","currency":"SEK"},{"id":"9","from":"2023-02-12T08:00:00.000+01:00","to":"2023-02-12T09:00:00.000+01:00","cost":37.242389225,"consumption":9.377,"consumptionUnit":"kWh","currency":"SEK"},{"id":"10","from":"2023-02-12T09:00:00.000+01:00","to":"2023-02-12T10:00:00.000+01:00","cost":32.778883225,"consumption":8.171,"consumptionUnit":"kWh","currency":"SEK"},{"id":"11","from":"2023-02-12T10:00:00.000+01:00","to":"2023-02-12T11:00:00.000+01:00","cost":21.0670651,"consumption":4.436,"consumptionUnit":"kWh","currency":"SEK"},{"id":"12","from":"2023-02-12T11:00:00.000+01:00","to":"2023-02-12T12:00:00.000+01:00","cost":0.98445655,"consumption":2.156,"consumptionUnit":"kWh","currency":"SEK"},{"id":"13","from":"2023-02-12T12:00:00.000+01:00","to":"2023-02-12T13:00:00.000+01:00","cost":0.68222785,"consumption":1.523,"consumptionUnit":"kWh","currency":"SEK"},{"id":"14","from":"2023-02-12T13:00:00.000+01:00","to":"2023-02-12T14:00:00.000+01:00","cost":0.5496218,"consumption":1.288,"consumptionUnit":"kWh","currency":"SEK"},{"id":"15","from":"2023-02-12T14:00:00.000+01:00","to":"2023-02-12T15:00:00.000+01:00","cost":0.5298075,"consumption":1.269,"consumptionUnit":"kWh","currency":"SEK"},{"id":"16","from":"2023-02-12T15:00:00.000+01:00","to":"2023-02-12T16:00:00.000+01:00","cost":0.677347125,"consumption":1.61,"consumptionUnit":"kWh","currency":"SEK"},{"id":"17","from":"2023-02-12T16:00:00.000+01:00","to":"2023-02-12T17:00:00.000+01:00","cost":1.1193823,"consumption":2.488,"consumptionUnit":"kWh","currency":"SEK"},{"id":"18","from":"2023-02-12T17:00:00.000+01:00","to":"2023-02-12T18:00:00.000+01:00","cost":1.155690375,"consumption":2.445,"consumptionUnit":"kWh","currency":"SEK"},{"id":"19","from":"2023-02-12T18:00:00.000+01:00","to":"2023-02-12T19:00:00.000+01:00","cost":1.15172305,"consumption":2.468,"consumptionUnit":"kWh","currency":"SEK"},{"id":"20","from":"2023-02-12T19:00:00.000+01:00","to":"2023-02-12T20:00:00.000+01:00","cost":0.81017805,"consumption":1.803,"consumptionUnit":"kWh","currency":"SEK"},{"id":"21","from":"2023-02-12T20:00:00.000+01:00","to":"2023-02-12T21:00:00.000+01:00","cost":0.7772117375,"consumption":1.837,"consumptionUnit":"kWh","currency":"SEK"},{"id":"22","from":"2023-02-12T21:00:00.000+01:00","to":"2023-02-12T22:00:00.000+01:00","cost":0.6472297625,"consumption":1.567,"consumptionUnit":"kWh","currency":"SEK"},{"id":"23","from":"2023-02-12T22:00:00.000+01:00","to":"2023-02-12T23:00:00.000+01:00","cost":0.5633025,"consumption":1.416,"consumptionUnit":"kWh","currency":"SEK"},{"id":"24","from":"2023-02-12T23:00:00.000+01:00","to":"2023-02-13T00:00:00.000+01:00","cost":0.4434144,"consumption":1.292,"consumptionUnit":"kWh","currency":"SEK"}]
    """.data(using: .utf8)!
}

extension DateFormatter {
    static let json: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS+01:00"
        return dateFormatter
    }()

}

extension JSONDecoder {
    var dateDecodingStrategyFormatters: [DateFormatter]? {
        @available(*, unavailable, message: "This variable is meant to be set only")
        get { return nil }
        set {
            guard let formatters = newValue else { return }
            self.dateDecodingStrategy = .custom { decoder in

                let container = try decoder.singleValueContainer()
                let dateString = try container.decode(String.self)

                for formatter in formatters {
                    if let date = formatter.date(from: dateString) {
                        return date
                    }
                }

                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateString)")
            }
        }
    }
}

