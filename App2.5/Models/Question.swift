//
//  File.swift
//  App2.5
//
//  Created by Zakir on 08.08.2021.
//

struct Question {
    var title: String
    var type: ResponseType
    var answers: [Answer]
    
    static func getQuestions () -> [Question] {
    [
    Question(
        title: "Какую пищу предпочитаете",
        type: .single,
            answers: [
           Answer(title: "Стейк", type: .dog ),
           Answer(title: "рыба", type: .cat),
           Answer(title: "мясо", type: .lion),
           Answer(title: "кукуруза", type: .rabbit)
        ]
     
    ),
        
    Question(
        title: "Что вам нравиться больше всего?",
        type: .multiple,
            answers: [
            Answer(title: "Плавать", type: .dog ),
            Answer(title: "Играть", type: .cat),
            Answer(title: "Спать", type: .lion),
            Answer(title: "Бегать", type: .rabbit)
           
            ]
        ),
            
    Question(
        title: "Любите ли вы поездки на авто?",
        type: .ranged,
            answers: [
            Answer(title: "Ненавижу", type: .dog ),
            Answer(title: "Нервничаю", type: .cat),
            Answer(title: "Злюсь", type: .lion),
            Answer(title: "Люблю", type: .rabbit)
    
               ]
            
            )
    
        ]

    }

}

struct Answer {
    let title: String
    let type: AnimalType

}

enum ResponseType {
    case single
    case multiple
    case ranged
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case lion = "🦁"
    case rabbit = "🐰"
    
    var definition: String {
        switch self {
        
        case .dog:
            return "Вам нравиться быть с друзьями.Вы окружаете себе людьми,которые вам нравятся и всегда готовы помочь."
            
        case .cat:
            return "Вы себе на уме. любите гулять сами по себе.Вы цените одиночество."
            
        case .lion:
            return "Вы величественный в любой среде.Достойны уважения,любите одиночество.Бесстрашный одинокий царь зверей)."
            
        case .rabbit:
            return "У вас не плохой аппетит.Любите морковь и спать на мягком месте."
          
        }
                
    }
    
}
