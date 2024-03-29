//
//  ContentView.swift
//  ChartTest
//
//  Created by Jacek Kosinski U on 11/01/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State private var consumption: [Consumption] = []



    var body: some View {

        VStack {
            Group{
                if !consumption.isEmpty {
                    ConsumptionChartView(consumption: $consumption)
                        .frame(minWidth: 450, minHeight: 250)
                        .padding()
                } else {
                    ContentUnavailableView(
                        "No Data for You",
                        systemImage: "doc.richtext.fill",
                        description: Text("Pray for data.")
                    )
                }
            }
        }
        .environment(\.colorScheme, .dark)
        .background(.black)
        .onAppear {
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategyFormatters = [ DateFormatter.json ]
                 consumption = try decoder.decode([Consumption].self, from: Consumption.data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}

#Preview {
    ContentView()

}
