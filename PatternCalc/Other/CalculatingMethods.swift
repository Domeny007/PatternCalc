
import Foundation

class CalculatingMethods {
    // MARK: - операции подсчета для двух чисел -
    func calculate(with operation: SimpleOperations, and firstNumber: Double, and secondNumber: Double) -> Double {
        var result: Double
        switch operation {
        case .divide   : result = firstNumber / secondNumber
        case .minus    : result = firstNumber - secondNumber
        case .multiply : result = firstNumber * secondNumber
        case .plus     : result = firstNumber + secondNumber
        }
        return result
    }
    // MARK: - операции подсчета для одного числа -
    func calculate(with operation: OtherOperations, and number: Double) -> Double {
        var result: Double
        switch operation {
        case .exponentiation: result = number * number
        case .percent       : result = number / 100
        }
        return result
    }
}


