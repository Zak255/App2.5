//
//  QuestionViewController.swift
//  App2.5
//
//  Created by Zakir on 09.08.2021.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var stackOneView: UIStackView!
    @IBOutlet var oneViewButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    
    @IBOutlet weak var rangerdStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count)
            
            rangedSlider.value = answerCount / 2
            rangedSlider.maximumValue = answerCount
        }
    }
    
    @IBOutlet weak var questionProgresView: UIProgressView!
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var currentAnswers: [Answer] {
         questions[questionIndex].answers
    }
    private var answersChooser: [Answer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = oneViewButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[buttonIndex]
        answersChooser.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
            answersChooser.append(answer)
        }
    }
    nextQuestion()
}
    @IBAction func rangedAnswerButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answersChooser.append(currentAnswers[index])
        
        nextQuestion()
    }
}

// MARK: - Private Methods
extension QuestionViewController {
    private func setupUI() {
        for stackView in [stackOneView, multipleStackView, rangerdStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = questions[questionIndex]
        
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float (questionIndex) / Float (questions.count)
        questionProgresView.setProgress(totalProgress, animated: true)
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswers (for: currentQuestion.type)
        
    }
    
    private func showCurrentAnswers (for type: ResponseType) {
        switch type {
        case .single: showSingleStackView(with: currentAnswers)
        case .multiple: showMultipleStackView(with: currentAnswers)
        case .ranged: showRengedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        stackOneView.isHidden = false
        
        for (button, answer) in zip(oneViewButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    private func nextQuestion() {
        questionIndex += 1
        if questionIndex > questions.count {
            setupUI()
            return
        }
        performSegue(withIdentifier: "resultSeque", sender: nil)
    }
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    private func showRengedStackView(with answers: [Answer]) {
        rangerdStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    
   }
}
