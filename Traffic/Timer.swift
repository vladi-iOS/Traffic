//
//  Timer.swift
//  Traffic
//
//  Created by Vladimir Spasov on 3/9/24.
//

import Foundation

protocol TimerProtocol {
    func schedule(after interval: TimeInterval, repeats: Bool, block: @escaping () -> Void)
    func invalidate()
}

class RealTimer: TimerProtocol {
    private var timer: Timer?

    func schedule(after interval: TimeInterval, repeats: Bool, block: @escaping () -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: repeats) { _ in
            block()
        }
    }

    func invalidate() {
        timer?.invalidate()
        timer = nil
    }
}

class MockTimer: TimerProtocol {
    private var block: (() -> Void)?

    func schedule(after interval: TimeInterval, repeats: Bool, block: @escaping () -> Void) {
        self.block = block
    }

    func invalidate() {
        block = nil
    }

    func trigger() {
        block?()
    }
}
