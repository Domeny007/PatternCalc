
class CalculatorViewPresenter: DetailViewPresenter {
    
    var view: DetailView!
    var calculating: CalculatingMethods!
    let zeroNumber = "0"
    let comma = ","
    var secondNumber = false
    var mainOperation: SimpleOperations?
    var firstNumberSaved: Double?
    var resultAsString: String = ""
    
    
    //    MARK: - Операции при нажатии на кнопки -
    func commaButtonPressed(with calculatorLabelText: String) {
        if  !calculatorLabelText.contains(comma){
        view.setTextToCalculatorLabel(calculatorLabelText + comma)
        }
    }
    
    func numberButtonPressed(with title: String, and calculatorLabelText: String) {
        if calculatorLabelText == zeroNumber {
            view.setTextToCalculatorLabel(title)
        } else if secondNumber {
            view.setTextToCalculatorLabel(title)
            secondNumber = false
        } else {
            view.setTextToCalculatorLabel(calculatorLabelText + title)
        }
    }
    
    func operationButtonPressed(with operationTitle: String, and calculatorLabelText: String) {
        guard let operation = SimpleOperations(rawValue: operationTitle) else { return }
        secondNumber = true
        mainOperation = operation
        guard let firstNumber = Double(calculatorLabelText.replacingOccurrences(of: ",", with: ".")) else {return}
        firstNumberSaved = firstNumber
    }
    
    func otherOperationButtonPressed(with operationTitle: String, and calculatorLabelText: String) {
        guard let otherOperation = OtherOperations(rawValue: operationTitle), let currentNumber = Double(calculatorLabelText.replacingOccurrences(of: ",", with: ".")) else {return}
        let result = calculating.calculate(with: otherOperation, and: currentNumber)
        calculate(with: result)
    }
    
    func clearButtonPressed() {
        firstNumberSaved = nil
        secondNumber = false
        mainOperation = nil
        
        view.setTextToCalculatorLabel(zeroNumber)
    }
    
    func resultButtonPressed(with calculatorLabelText: String) {
        guard let firstNumber = firstNumberSaved, let secondNumber = Double(calculatorLabelText.replacingOccurrences(of: ",", with: ".")), let operation = mainOperation else {return}
        let result = calculating.calculate(with: operation, and: firstNumber, and: secondNumber)
        calculate(with: result)
        
    }
    //    MARK: - функция для счета -
    func calculate(with result: Double?) {
        guard let result = result else {return}
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            resultAsString = String(Int(result))
        } else {
            resultAsString = String(result)
            resultAsString = resultAsString.replacingOccurrences(of: ".", with: ",")
        }
        view.setTextToCalculatorLabel(resultAsString)
    }
    
}













