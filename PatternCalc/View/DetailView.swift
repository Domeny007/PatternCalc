
import Foundation

// MARK: - протокол для view (посредник между presenter и view) -
protocol DetailView {
    func setTextToCalculatorLabel(_ text: String)
}
