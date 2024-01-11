//
//  NbpRatesChartView.swift
//  ChartTest
//
//  Created by Jacek Kosinski U on 11/01/2024.
//

import Foundation
import SwiftUI

import Charts

// MARK: Chart implementation

struct NbpRatesChartView: View {
    @Binding var rates: [NbpRates]

    var body: some View {
        VStack(alignment: .leading) {
            let strideBy: Double = 6

            let costs = rates.map { $0.mid }
            let costMin = costs.min()!
            let costMax = costs.max()!



            Text("Cost")
                .font(.footnote)
            Chart(rates) { item in
                LineMark(
                    x: .value("Date", item.effectiveDate),
                    y: .value("Price", item.mid)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(.green)
                .lineStyle(StrokeStyle(lineWidth: 3))
                .foregroundStyle(by: .value("Value", "Cost"))


            }
            .chartForegroundStyleScale([
                "Cost": .blue,

            ])

            .chartYAxis {

                let costsStride = Array(stride(from: costMin,
                                               through: costMax,
                                               by: (costMax - costMin)/strideBy))
                AxisMarks(position: .trailing, values: costsStride) { axis in
                    AxisGridLine()
                    let value = costsStride[axis.index]
                    AxisValueLabel("\(String(format: "%.4F", value)) PLN", centered: false)
                }


            }
            .chartYScale(domain: costMin...costMax)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    NbpContentView()
}
