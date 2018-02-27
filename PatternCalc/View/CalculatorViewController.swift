
import UIKit

class CalculatorViewController: UIViewController, DetailView {
    
    
    @IBOutlet weak var calculatorLabel: UILabel!
    
    var presenter: DetailViewPresenter!
    
    var pressedOperationButton: UIButton?
    // MARK: - действие при нажатии на кнопки -
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.title(for: .normal), let calculatorLabelText = calculatorLabel.text else { return }
        presenter.numberButtonPressed(with: buttonTitle, and: calculatorLabelText)
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        guard let operationTitle = sender.title(for: .normal),
              let calculatorLabelText = calculatorLabel.text else { return }
        presenter.operationButtonPressed(with: operationTitle, and: calculatorLabelText)
        
    }
    
    @IBAction func otherOperationButtonPressed(_ sender: UIButton) {
        guard let operationTitle = sender.title(for: .normal),let calculatorLabelText = calculatorLabel.text else { return }
        presenter.otherOperationButtonPressed(with: operationTitle, and: calculatorLabelText)
    }
    
    @IBAction func commaButtonPressed(_ sender: UIButton) {
        guard let calculatorLabelText = calculatorLabel.text else { return }
        presenter.commaButtonPressed(with: calculatorLabelText)
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
        guard let result = calculatorLabel.text else { return }
        presenter.resultButtonPressed(with: result)
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        presenter.clearButtonPressed()
    }
    
    func setTextToCalculatorLabel(_ text: String) {
        calculatorLabel.text = text
    }
    
    
    
}
