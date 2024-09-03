//
//  TrafficLightViewModel.swift
//  Traffic
//
//  Created by Vladimir Spasov on 3/9/24.
//

import Foundation

@MainActor
class TrafficLightViewModel: ObservableObject {
    @Published var currentLight: TrafficLightState = .red

    private let timer: TimerProtocol
    private var lightSequence: [TrafficLightState] = [.red, .green, .orange]
    private var currentIndex: Int = 0

    private let lightDurations: [TrafficLightState: TimeInterval] = [
        .red: 4.0,
        .green: 4.0,
        .orange: 1.0
    ]

    init(timer: TimerProtocol = RealTimer()) {
        self.timer = timer
        startTimer()
    }

    func startTimer() {
        changeLight()
    }

    private func changeLight() {
        currentLight = lightSequence[currentIndex]
        let duration = lightDurations[currentLight] ?? 4.0

        timer.schedule(after: duration, repeats: false) { [weak self] in
            self?.advanceToNextLight()
        }
    }

    private func advanceToNextLight() {
        currentIndex = (currentIndex + 1) % lightSequence.count
        changeLight()
    }

    deinit {
        timer.invalidate()
    }
}
