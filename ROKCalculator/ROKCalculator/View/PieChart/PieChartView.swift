//
//  PieChartView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import SwiftUI

struct PieChartView: View {
    @State private var activeIndex: Int = -1
    
    let rssType: RssType
    
    let values: [Double]
    let names: [String]
    let formatter: (Double) -> String
    
    var colors: [Color]
    var backgroundColor: Color
    
    var widthFraction: CGFloat
    var innerRadiusFraction: CGFloat
    
    var slices: [PieSliceData] {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (index, value) in values.enumerated() {
            let degrees: Double = value * 360 / sum
            tempSlices.append(
                PieSliceData(
                    startAngle: Angle(degrees: endDeg),
                    endAngle: Angle(degrees: endDeg + degrees),
                    color: colors[index]))
            endDeg += degrees
        }
        return tempSlices
    }
    
    init(
        rssType: RssType,
        values: [Double],
        names: [String],
        formatter: @escaping (Double) -> String = { value in String(format: "%.2f", value) },
        colors: [Color] = [Color.blue, Color.green, Color.orange],
        backgroundColor: Color = Color(UIColor.secondarySystemBackground),
        widthFraction: CGFloat = 0.40,
        innerRadiusFraction: CGFloat = 0.60
    ) {
        self.rssType = rssType
        self.values = values
        self.names = names
        self.formatter = formatter
        
        self.colors = colors
        self.backgroundColor = backgroundColor
        self.widthFraction = widthFraction
        self.innerRadiusFraction = innerRadiusFraction
    }
    
    public var body: some View {
        GeometryReader { geometry in
            HStack {
                ZStack {
                    ForEach(0..<values.count, id: \.self) { index in
                        PieSliceView(pieSliceData: slices[index])
                            .scaleEffect(activeIndex == index ? 1.03 : 1)
                    }
                    .frame(width: widthFraction * geometry.size.width, height: widthFraction * geometry.size.width)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let radius = 0.5 * widthFraction * geometry.size.width
                                let diff = CGPoint(
                                    x: value.location.x - radius,
                                    y: radius - value.location.y
                                )
                                let dist = pow(pow(diff.x, 2.0) + pow(diff.y, 2.0), 0.5)
                                if (dist > radius || dist < radius * innerRadiusFraction) {
                                    withAnimation {
                                        activeIndex = -1
                                    }
                                    return
                                }
                                var radians = Double(atan2(diff.x, diff.y))
                                if (radians < 0) {
                                    radians = 2 * Double.pi + radians
                                }
                                
                                for (index, slice) in slices.enumerated() {
                                    if (radians < slice.endAngle.radians) {
                                        withAnimation {
                                            activeIndex = index
                                        }
                                        break
                                    }
                                }
                            }
                            .onEnded { value in
                                withAnimation {
                                    activeIndex = -1
                                }
                            }
                    )
                    Circle()
                        .fill(backgroundColor)
                        .frame(
                            width: widthFraction * geometry.size.width * innerRadiusFraction,
                            height: widthFraction * geometry.size.width * innerRadiusFraction
                        )
                    
                    VStack(spacing: 0) {
                        if activeIndex == -1 {
                            Image(rssType.rawValue)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                        } else {
                            Text(names[activeIndex])
                                .foregroundColor(Color.gray)
                        }
                        Text(
                            getFormattedValue(
                                activeIndex == -1
                                ? values.reduce(0, +)
                                : values[activeIndex]
                            )
                        )
                        .foregroundColor(.primary)
                    }
                    
                }
                PieChartRows(
                    colors: colors,
                    names: names,
                    values: values.map { getFormattedValue($0) },
                    percents: values.map {
                        String(format: "%.2f%%", $0 * 100 / values.reduce(0, +))
                    }
                )
            }
            .padding()
            .background(backgroundColor)
        }.frame(height: 200)
            .cornerRadius(12)
    }
}

extension PieChartView {
    func getFormattedValue(_ value: Double) -> String {
        if value >= 1000000000 {
            let newValue = Double(value) / 1000000000
            return "\(String(format: "%.1f", newValue))B"
        } else if value >= 1000000 {
            let newValue = Double(value) / 1000000
            return "\(String(format: "%.1f", newValue))M"
        } else {
            let newValue = Double(value) / 1000
            return "\(String(format: "%.0f", newValue))K"
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(
            rssType: .food,
            values: [1309, 550, 3700],
            names: ["Rent", "Transport", "Education"],
            formatter: { value in String(format: "%.2f", value) }
        ).padding(.horizontal)
    }
}

struct PieChartRows: View {
    var colors: [Color]
    var names: [String]
    var values: [String]
    var percents: [String]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<values.count, id: \.self) { index in
                    HStack {
                        RoundedRectangle(cornerRadius: 5.0)
                            .fill(colors[index])
                            .frame(width: 20, height: 20)
                        Text(names[index])
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        Spacer()
                        VStack(alignment: .trailing, spacing: 0) {
                            Text(values[index])
                                .font(.subheadline)
                                .foregroundColor(.primary)
                            Text(percents[index])
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                    }
                }
            }.padding(.trailing)
        }
    }
}
