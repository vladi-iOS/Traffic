//
//  CarViewModel.swift
//  Traffic
//
//  Created by Vladimir Spasov on 3/9/24.
//

import Foundation

class CarViewModel: ObservableObject {
    @Published var carModel: String = ""

    var isValid: Bool {
        return carModel.count >= 3
    }
}
