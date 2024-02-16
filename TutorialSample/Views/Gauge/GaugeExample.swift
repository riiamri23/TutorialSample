//
//  LandmarkLists.swift
//  TutorialSample
//
//  Created by rii amri on 20/11/23.
//

import SwiftUI

struct GaugeExample: View {
    var body: some View {
        Gauge(value:33.0, in: 0.0...100.0){
            Text("Speed").foregroundStyle(Color.blue)
        } currentValueLabel: {
            Text("33").foregroundStyle(Color.blue)
        }minimumValueLabel: {
            Text("0").foregroundStyle(Color.blue)
        } maximumValueLabel: {
            Text("100").foregroundStyle(Color.blue)
        }.gaugeStyle(DefaultGaugeStyle())
        
    }
}


#Preview("GaugeExample") {
    GaugeExample()
}
