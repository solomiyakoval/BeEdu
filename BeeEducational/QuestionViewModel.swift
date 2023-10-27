//
//  QuestionViewModel.swift
//  BeeEducational
//
//  Created by Solomiya Koval on 20.10.2023.
//

import Foundation

class QuestionViewModel {
    var questions = [
        Question(question: "Which item cannot be recycled?", choices: ["Plastic bottle", "Carton package","Diaper", "Glass bottle"], answer: "Diaper"),
    Question(question: "Which type of pollution is cased by exhaust gases from cars?", choices:["Air pollution", "Water pollution","Land pollution","Noise pollution"], answer: "Air pollution"),
    Question(question: "Why cows and other livestock animals affect climate change?", choices: ["They eat a lot", "They produce methane emissions – a potent greenhouse gas","They need a large piece of land to graze", "They eat a lot of meat"], answer: "They produce methane emissions – a potent greenhouse gas"),
    Question(question: "Which action is sustainable?", choices: ["Buying a lot of clothes", "Riding a bicycle", "Avoiding separation of waste",  "Using private car"], answer: "Riding a bicycle"),
    Question(question: "What cannot be composted?", choices: ["Apple", "Banana peel", "Old phone","Carrot"], answer: "Old phone"),
    Question(question: "What doesn’t save energy at home?", choices: ["Turned on TV when you aren’t watching it", "Turned off devices when they are not used","Energy efficient bulbs", "Turning off light every time you leave the room"], answer: "Turned on TV when you aren’t watching it"),
    Question(question: "Which type of energy production is sustainable?", choices: ["Power plant energy", "Nuclear energy", "Natural gas energy", "Solar panels energy"], answer: "Solar panels energy"),
    Question(question: "What is the greenest way of travelling?", choices: ["By car", "By train", "On foot/ by bicycle", "By plane"], answer: "On foot/ by bicycle"),
    Question(question: "Which products contribute less to the environment?", choices: [ "Imported from other countries", "Transported with ship", "Locally grown and not packed at all", "Packed in 5 different packages"], answer: "Locally grown and not packed at all"),
    Question(question: "Why recently glaciers are melting a lot?", choices: ["because animals are living on them", "because of people’s investigation of glaciers",  "because the temperature on the Earth is rising", "because there are heaters on glaciers"], answer: "because the temperature on the Earth is rising")
    
    
    
    
    
]
}
