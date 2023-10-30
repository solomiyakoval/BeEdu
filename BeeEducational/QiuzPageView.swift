import SwiftUI

struct Duestion: Identifiable {
    let id = UUID()
    let text: String
    let choices: [String]
    let correctAnswer: Int
}

struct QiuzPageView: View {
    @State private var currentQuestionIndex = 0
    @State private var userScore = 0
    @State private var answered = false
    @State private var quizStarted = false
    @State private var isAnswerCorrect: Bool?
    @State private var selectedAnswerIndex: Int?
    @State private var showingResult = false
    @State private var showQuiz = false
    
    let questions: [Duestion] = [
        Duestion(text: "Which item cannot be recycled?", choices: ["Plastic bottle", "Carton package", "Diaper", "Glass bottle"], correctAnswer: 2),
        Duestion(text: "Which type of pollution is cased by exhaust gases from cars?", choices: ["Air pollution", "Water pollution", "Land pollution", "Noise pollution"], correctAnswer: 0),
        Duestion(text: "Why cows and other livestock animals affect climate change?", choices: ["They eat a lot", "They produce methane emissions – a potent greenhouse gas", "They need a large piece of land to graze", "They eat a lot of meat"], correctAnswer: 1),
        Duestion(text: "Which action is sustainable?", choices: ["Buying a lot of clothes", "Riding a bicycle", "Avoiding separation of waste", "Using private car"], correctAnswer: 1),
        Duestion(text: "What cannot be composted?", choices: ["Apple", "Banana peel", "Old phone", "Carrot"], correctAnswer: 2),
        Duestion(text: "What doesn’t save energy at home?", choices: ["Turned on TV when you aren’t watching it", "Turned off devices when they are not used", "Energy efficient bulbs", "Turning off light every time you leave the room"], correctAnswer: 0),
        Duestion(text: "Which type of energy production is sustainable?", choices: ["Power plant energy", "Nuclear energy", "Natural gas energy", "Solar panels energy"], correctAnswer: 3),
        Duestion(text: "What is the greenest way of travelling?", choices: ["By car", "By train", "On foot/ by bicycle", "By plane"], correctAnswer: 2),
        Duestion(text: "Which products contribute less to the environment?", choices: ["Imported from other countries", "Transported with ship", "Locally grown and not packed at all", "Packed in 5 different packages"], correctAnswer: 2),
        Duestion(text: "Why recently glaciers are melting a lot?", choices: ["because animals are living on them", "because of people’s investigation of glaciers", "because the temperature on the Earth is rising", "because there are heaters on glaciers"], correctAnswer: 2)
        ]

    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                if !showQuiz {
                    Button("Start Quiz", action: startQuiz).frame(width: 207, height: 64, alignment: .center)
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .background(Color(red: 0.48, green: 1, blue: 0.16))
                        .foregroundColor(.black)
                        .cornerRadius(40)
                } else if showQuiz {
                    if currentQuestionIndex < questions.count {
                        Text("Question \(currentQuestionIndex + 1):").font(Font.custom("Titan One", size: 40)).fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.53, green: 0.8, blue: 0.36))
                            .frame(width: 327, height: 53, alignment: .top)
                        Text(questions[currentQuestionIndex].text)
                            .fontWeight(.bold)
                            .padding().font(Font.custom("Titan One", size: 30))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.53, green: 0.8, blue: 0.36))
                            .frame(width: 370, height: 170, alignment: .top)
                        
                        ForEach(0..<questions[currentQuestionIndex].choices.count, id: \.self) { index in
                            Button(action: {
                                if !answered {
                                    checkAnswer(selectedAnswer: index)
                                }
                            }) {
                                Text(questions[currentQuestionIndex].choices[index])
                                    .padding()
                                    .background(
                                        getBackgroundColorForAnswer(index: index)
                                    ).cornerRadius(40)
                                    .foregroundColor(.black)
                                    .font(Font.custom("Titan One", size: 25))
                                    .multilineTextAlignment(.center)
                            }
                            .disabled(answered)
                        }
                    } else if !showingResult {
                        ZStack{
                            Button("Show score", action: showResult).background(.gray
                            ).cornerRadius(40)
                            .foregroundColor(.black)
                            .font(Font.custom("Titan One", size: 25))
                            .multilineTextAlignment(.center)
                        }
                    } else {
                        VStack {
                            Text("You answered \(userScore)/\(questions.count) questions correctly.")
                                .font(Font.custom("Titan One", size: 30))
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.53, green: 0.8, blue: 0.36))
                                .frame(width: 370, height: 170, alignment: .top)
                            
                            Button("Try again", action: restartQuiz)
                                .frame(width: 207, height: 64, alignment: .center)
                                    .font(.system(size: 35))
                                    .fontWeight(.bold)
                                    .background(Color(red: 0.48, green: 1, blue: 0.16))
                                    .foregroundColor(.black)
                                    .cornerRadius(40)
                        }
                    }
                }
            }
            if answered {
                    Button("Next", action: nextQuestion).background(.gray
                    ).frame(width: 100, height: 54, alignment: .center)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .background(.gray)
                    .foregroundColor(.black)
                    .cornerRadius(40)
                    .position(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height * 0.87)
            }
            if let isCorrect = isAnswerCorrect {
                Text(isCorrect ? "You’re right!" : "Wrong answer").font(Font.custom("Titan One", size: 25))
                    .font(.title)
                    .foregroundColor(isCorrect ? .green : .red).position(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height * 0.07)
            }
        }
        
    }

    func checkAnswer(selectedAnswer: Int) {
        if selectedAnswer == questions[currentQuestionIndex].correctAnswer {
            userScore += 1
            isAnswerCorrect = true
        } else {
            isAnswerCorrect = false
        }
        answered = true
        selectedAnswerIndex = selectedAnswer
    }

    func nextQuestion() {
        currentQuestionIndex += 1
        answered = false
        isAnswerCorrect = nil
        selectedAnswerIndex = nil

        if currentQuestionIndex == questions.count {
            showingResult = true
        }
    }

    func showResult() {
        showingResult = true
    }
    
    func startQuiz() {
        showQuiz = true
        currentQuestionIndex = 0
        userScore = 0
        answered = false
        isAnswerCorrect = nil
        selectedAnswerIndex = nil
        showingResult = false
    }
    
    func restartQuiz() {
        showQuiz = false
        currentQuestionIndex = 0
        userScore = 0
        answered = false
        isAnswerCorrect = nil
        selectedAnswerIndex = nil
        showingResult = false
    }
    
    func getBackgroundColorForAnswer(index: Int) -> Color {
        if let isCorrect = isAnswerCorrect {
            if isCorrect {
                return index == questions[currentQuestionIndex].correctAnswer ? .green : Color(red: 0.85, green: 0.85, blue: 0.85)
            } else {
                if index == selectedAnswerIndex {
                    return .red
                } else if index == questions[currentQuestionIndex].correctAnswer {
                    return .green
                }
            }
        }
        return Color(red: 0.85, green: 0.85, blue: 0.85)
    }
}

#Preview {
    QiuzPageView()
}
