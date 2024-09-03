//
//  CarView.swift
//  Traffic
//
//  Created by Vladimir Spasov on 3/9/24.
//

import SwiftUI

struct CarView: View {
    @StateObject private var viewModel = CarViewModel()
    @State private var isNavigating = false

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter your car model", text: $viewModel.carModel)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Start Driving") {
                    if viewModel.isValid {
                        isNavigating = true
                    }
                }
                .disabled(!viewModel.isValid)
                .padding()
            }
            .padding()
            .navigationDestination(isPresented: $isNavigating) {
                TrafficLightView(carModel: viewModel.carModel)
            }
        }
    }
}

