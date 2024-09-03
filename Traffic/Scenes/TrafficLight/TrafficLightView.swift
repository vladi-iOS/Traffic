//
//  TrafficLightView.swift
//  Traffic
//
//  Created by Vladimir Spasov on 3/9/24.
//

import SwiftUI

struct TrafficLightView: View {
    let carModel: String
    @StateObject private var viewModel = TrafficLightViewModel()

    var body: some View {
        VStack {
            Text("Car Model: \(carModel)")
                .font(.headline)
                .padding()

            Circle()
                .fill(viewModel.currentLight == .red ? Color.red.opacity(1.0) : Color.red.opacity(0.3))
                .frame(width: 100, height: 100)
                .padding(.bottom)
                .animation(.easeInOut(duration: 0.5), value: viewModel.currentLight)

            Circle()
                .fill(viewModel.currentLight == .orange ? Color.orange.opacity(1.0) : Color.orange.opacity(0.3))
                .frame(width: 100, height: 100)
                .padding(.bottom)
                .animation(.easeInOut(duration: 0.5), value: viewModel.currentLight)

            Circle()
                .fill(viewModel.currentLight == .green ? Color.green.opacity(1.0) : Color.green.opacity(0.3))
                .frame(width: 100, height: 100)
                .padding(.bottom)
                .animation(.easeInOut(duration: 0.5), value: viewModel.currentLight)
        }
    }
}

