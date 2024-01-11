//
//  ChartView.swift
//  ChartTest
//
//  Created by Jacek Kosinski U on 11/01/2024.
//

import Foundation
import SwiftUI

import Charts

// MARK: Chart implementation

struct ConsumptionChartView: View {
    @Binding var consumption: [Consumption]

    var body: some View {
        VStack(alignment: .leading) {
            let strideBy: Double = 6

            let costs = consumption.map { $0.cost }
            let costMin = costs.min()!
            let costMax = costs.max()!

            let consumptions = consumption.map { $0.consumption }
            let consumptionMin = consumptions.min()!
            let consumptionMax = consumptions.max()!

            Text("Cost")
                .font(.footnote)
            Chart(consumption) { item in
                LineMark(
                    x: .value("Hour", item.from),
                    y: .value("Price", item.cost / costMax)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(.green)
                .lineStyle(StrokeStyle(lineWidth: 3))
                .foregroundStyle(by: .value("Value", "Cost"))

                LineMark(
                    x: .value("Hour", item.from),
                    y: .value("Consumption", item.consumption / consumptionMax)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(.blue)
                .lineStyle(StrokeStyle(lineWidth: 3))
                .foregroundStyle(by: .value("Value", "Consumption"))
            }
            .chartForegroundStyleScale([
                "Consumption": .blue,
                "Cost": .green,
            ])
            .chartXAxis {
                AxisMarks(values: .stride(by: .hour, count: 4)) { _ in
                    AxisValueLabel(format: .dateTime.hour(.twoDigits(amPM: .abbreviated)))
                }
            }
            .chartYAxis {
                let defaultStride = Array(stride(from: 0, to: 1, by: 1.0/strideBy))
                let costsStride = Array(stride(from: costMin,
                                               through: costMax,
                                               by: (costMax - costMin)/strideBy))
                AxisMarks(position: .trailing, values: defaultStride) { axis in
                    AxisGridLine()
                    let value = costsStride[axis.index]
                    AxisValueLabel("\(String(format: "%.2F", value)) kr", centered: false)
                }

                let consumptionStride = Array(stride(from: consumptionMin,
                                                     through: consumptionMax,
                                                     by: (consumptionMax - consumptionMin)/strideBy))
                AxisMarks(position: .leading, values: defaultStride) { axis in
                    AxisGridLine()
                    let value = consumptionStride[axis.index]
                    AxisValueLabel("\(String(format: "%.2F", value)) kWh", centered: false)
                }
            }
            .padding(.bottom, 20)
        }
    }
}
