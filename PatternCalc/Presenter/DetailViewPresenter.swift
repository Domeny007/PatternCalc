
import Foundation

// MARK: - протокол для presenter -
protocol DetailViewPresenter {
    func commaButtonPressed(with calculatorLabelText: String)
    func numberButtonPressed(with title: String, and calculatorLabelText: String)
    func operationButtonPressed(with operationTitle: String, and calculatorLabelText: String)
    func otherOperationButtonPressed(with operationTitle: String, and calculatorLabelText: String)
    func clearButtonPressed()
    func resultButtonPressed(with digitsLabelText: String)
}
