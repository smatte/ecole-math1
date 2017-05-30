import Foundation
import UIKit
import SnapKit

class MainView: UIView {
    let question = UILabel()
    let answer = UITextField()

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 0.934, green: 0.924, blue: 0.277, alpha: 1.0)

        question.text = " "
        question.font = UIFont.boldSystemFont(ofSize: 44)
        question.textAlignment = .center
        question.sizeToFit()
        addSubview(question)

        answer.keyboardType = .decimalPad
        answer.becomeFirstResponder()
        addSubview(answer)

        updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        question.snp.makeConstraints {(maker) in
            maker.center.equalToSuperview()
            maker.width.equalToSuperview()
        }
        super.updateConstraints()
    }
}
