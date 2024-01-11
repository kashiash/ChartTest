//
//  NbpContentView.swift
//  ChartTest
//
//  Created by Jacek Kosinski U on 11/01/2024.
//

import SwiftUI
import SwiftData

struct NbpContentView: View {

    @State private var rates: [NbpRates] = []



    var body: some View {

        VStack {
            Group{
                if !rates.isEmpty {
                    NbpRatesChartView(rates:  $rates)
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
                decoder.dateDecodingStrategyFormatters = [ DateFormatter.jsonNbp ]
                 rates = try decoder.decode([NbpRates].self, from: NbpRates.data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}



#Preview {
    NbpContentView()
}
