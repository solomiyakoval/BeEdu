import SwiftUI

struct MinigameTrash: View {
    let imageBinAssign = TrashBinImageAssign()
    
    @State private var objectA: ObjectA?
    @State private var objectBPosition: CGPoint = .zero
    @State private var isTimerRunning = true
    @State private var remainingTime = 20
    @State public var score = 0
    @State private var countdownTimer: Timer?
    @State private var objectBCoordinates: [CGPoint] = []
    @State private var showBorder = false
    @State private var isGameStarted = false
    @State private var blackScreenOpacity = 0.7
    @State private var showExitConfirmation = false
    
    @State var zero: Int = 0
    
    private var binOffsetY = 1.3
    private var binOffsetX = 1.68
    
    private var uiOffsetsX = 35.0
    private var uiOffsetsY = 65.0
    
    /*
     let trashItems: [TrashItem] = [
     TrashItem(image: "rectangle.portrait.and.arrow.right.fill", type: .paper, binType: .paperBin),
     TrashItem(image: "eraser.fill", type: .plastic, binType: .plasticBin),
     TrashItem(image: "folder.fill", type: .aluminum, binType: .aluminumBin),
     TrashItem(image: "heart.fill", type: .organic, binType: .organicBin),
     TrashItem(image: "facemask.fill", type: .glass, binType: .glassBin),
     //Icone e tipi di spazzatura
     ]
     */
    
    let trashItems: [TrashItem] = [
        TrashItem(image: "trash_icon13", type: .paper, binType: .paperBin),
        TrashItem(image: "trash_icon14", type: .plastic, binType: .plasticBin),
        TrashItem(image: "trash_icon2", type: .aluminum, binType: .aluminumBin),
        TrashItem(image: "trash_icon3", type: .organic, binType: .organicBin),
        TrashItem(image: "trash_icon1", type: .glass, binType: .glassBin),
        //Icone e tipi di spazzatura
    ]
    
    var countdownText: String {
        let minutes = self.remainingTime / 60
        let seconds = self.remainingTime % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Image("HillMinigameBackground").resizable().aspectRatio(contentMode: .fill).padding(.leading, 50.0).padding(.bottom, 50.0).frame(width: 500.0, height: 0.0)
                ZStack {
                    Color.black
                        .opacity(blackScreenOpacity)
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: 400.0, height: 800)
                    
                    // Pulsante "START"
                    if !isGameStarted {
                        Button("START") {
                            withAnimation {
                                isGameStarted = true
                                blackScreenOpacity = 0
                            }
                            spawnObjectA()
                            startTimer()
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 7)
                        .frame(width: 207, height: 64, alignment: .center)
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: .white, location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.48, green: 1, blue: 0.16), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0, y: -1.42),
                                endPoint: UnitPoint(x: 0.79, y: 1)
                            )
                        )
                        .foregroundColor(.black) // Cambia il colore del testo a blu o al colore desiderato
                        .cornerRadius(40)
                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 4)
                        .position(x: UIScreen.main.bounds.size.width / 1.66, y: UIScreen.main.bounds.size.height / 2)
                        .opacity(isGameStarted ? 0 : 1)
                        
                    }
                    
                    
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .frame(width: 0, height: 0) // Imposta le dimensioni di B principale (Cestini)
                        .position(objectBPosition)
                        .onAppear {
                            let rotationAngle = 3.14
                            let numberOfCestini = 4 // Impostiamo il numero desiderato di cestini
                            for i in 0..<numberOfCestini+1{
                                let angle = rotationAngle + 3.14 * CGFloat(i) / CGFloat(numberOfCestini)
                                let x = UIScreen.main.bounds.size.width / binOffsetX + cos(angle) * 150 // Raggio dell'arco
                                let y = UIScreen.main.bounds.size.height / binOffsetY + sin(angle) * 150 // Raggio dell'arco
                                objectBCoordinates.append(CGPoint(x: x, y: y))
                            }
                        }
                    
                    // Visualizza i cestini aggiuntivi
                    ForEach(0..<objectBCoordinates.count, id: \.self) { index in
                        ZStack {
                            Image(imageBinAssign.imageTrashBin[index])
                                .resizable()
                                .frame(width: 80, height: 100)
                                .position(objectBCoordinates[index])
                            
                            if let objectA = objectA, !objectA.disappeared {
                                if let binType = trashItems.first(where: { $0.type == objectA.trashType })?.binType {
                                    // Controlla il tipo di cestino associato e mostra il bordo corrispondente
                                    switch binType {
                                    case .paperBin:
                                        Image("bordo_giallo") // Immagine del bordo del cestino della carta
                                            .resizable()
                                            .frame(width: 80, height: 100)
                                            .position(objectBCoordinates[0])
                                            .opacity(1.0) // Il bordo è sempre visibile
                                            .transition(.opacity) // Aggiungi una transizione di opacità
                                            .onAppear {
                                                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                                                    showBorder.toggle() // Alterna l'opacità periodicamente con un'animazione
                                                }
                                            }
                                    case .plasticBin:
                                        Image("bordo_giallo") // Immagine del bordo del cestino della carta
                                            .resizable()
                                            .frame(width: 80, height: 100)
                                            .position(objectBCoordinates[1])
                                            .opacity(1.0) // Il bordo è sempre visibile
                                            .transition(.opacity) // Aggiungi una transizione di opacità
                                            .onAppear {
                                                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                                                    showBorder.toggle() // Alterna l'opacità periodicamente con un'animazione
                                                }
                                            }
                                    case .glassBin:
                                        Image("bordo_giallo") // Immagine del bordo del cestino della carta
                                            .resizable()
                                            .frame(width: 80, height: 100)
                                            .position(objectBCoordinates[2])
                                            .opacity(1.0) // Il bordo è sempre visibile
                                            .transition(.opacity) // Aggiungi una transizione di opacità
                                            .onAppear {
                                                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                                                    showBorder.toggle() // Alterna l'opacità periodicamente con un'animazione
                                                }
                                            }
                                    case .aluminumBin:
                                        Image("bordo_giallo") // Immagine del bordo del cestino della carta
                                            .resizable()
                                            .frame(width: 80, height: 100)
                                            .position(objectBCoordinates[3])
                                            .opacity(1.0) // Il bordo è sempre visibile
                                            .transition(.opacity) // Aggiungi una transizione di opacità
                                            .onAppear {
                                                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                                                    showBorder.toggle() // Alterna l'opacità periodicamente con un'animazione
                                                }
                                            }
                                    case .organicBin:
                                        Image("bordo_giallo") // Immagine del bordo del cestino della carta
                                            .resizable()
                                            .frame(width: 80, height: 100)
                                            .position(objectBCoordinates[4]) // Posiziona il bordo nella coordinata del cestino della carta
                                            .opacity(1.0) // Il bordo è sempre visibile
                                            .transition(.opacity) // Aggiungi una transizione di opacità
                                            .onAppear {
                                                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                                                    showBorder.toggle() // Alterna l'opacità periodicamente con un'animazione
                                                }
                                            }
                                    }
                                    // Aggiungi casi per gli altri tipi di cestino
                                }
                            }
                        }
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    // Implementa la logica del cestino
                                }
                        )
                        .opacity(isGameStarted ? 1.0 : 0.0)
                    }
                    
                    // Visualizza gli oggetti A (spazzatura) di base
                    if let objectA = objectA {
                        if !objectA.disappeared {
                            Image(trashItems.first { $0.type == objectA.trashType }?.image ?? "globe")
                                .resizable()
                                .frame(width: 100, height: 100) // Imposta le dimensioni di A (spazzatura)
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .position(objectA.position)
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            self.objectA?.position = value.location
                                        }
                                        .onEnded { value in
                                            //Calcolo posizione degli oggetti B (Cestini)
                                            let distanceToMainCestino: CGFloat
                                            if objectA.trashType == .paper {
                                                distanceToMainCestino = distanceBetweenPoints(objectA.position, objectBCoordinates[0])
                                            } else if objectA.trashType == .plastic {
                                                distanceToMainCestino = distanceBetweenPoints(objectA.position, objectBCoordinates[1])
                                            }
                                            else if objectA.trashType == .glass {
                                                distanceToMainCestino = distanceBetweenPoints(objectA.position, objectBCoordinates[2])
                                            }
                                            else if objectA.trashType == .aluminum {
                                                distanceToMainCestino = distanceBetweenPoints(objectA.position, objectBCoordinates[3])
                                            }
                                            else if objectA.trashType == .organic {
                                                distanceToMainCestino = distanceBetweenPoints(objectA.position, objectBCoordinates[4])
                                            }
                                            else {
                                                
                                                distanceToMainCestino = 0
                                            }
                                            
                                            // Assegnazione di punti positivi
                                            if distanceToMainCestino < 50 {
                                                if objectA.trashType == .paper {
                                                    self.score += 1
                                                } else if objectA.trashType == .plastic {
                                                    self.score += 1
                                                } else if objectA.trashType == .glass {
                                                    self.score += 1
                                                } else if objectA.trashType == .aluminum {
                                                    self.score += 1
                                                } else if objectA.trashType == .organic {
                                                    self.score += 1
                                                }
                                            } else {
                                                // Assegnazione di punti negativi
                                                if objectA.trashType == .paper {
                                                    self.score -= 1
                                                } else if objectA.trashType == .plastic {
                                                    self.score -= 1
                                                } else if objectA.trashType == .glass {
                                                    self.score -= 1
                                                } else if objectA.trashType == .aluminum {
                                                    self.score -= 1
                                                } else if objectA.trashType == .organic {
                                                    self.score -= 1
                                                }
                                            }
                                            
                                            if self.score < 0{
                                                self.score = 0
                                            }
                                            
                                            self.objectA = nil
                                            self.spawnObjectAAfterDelay()
                                        }
                                    
                                    
                                )
                        }
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        // Visualizza il timer solo se il gioco è iniziato
                        Text("\(self.countdownText)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .opacity(isGameStarted ? 1.0 : 0.0) // Imposta l'opacità in base a isGameStarted
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 19)
                    .padding(.top, 0)
                    .padding(.bottom, 1)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.48, green: 1, blue: 0.16), location: 0.00),
                                Gradient.Stop(color: .white, location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.78, y: 1),
                            endPoint: UnitPoint(x: 0.1, y: -1.66)
                        )
                    )
                    .cornerRadius(100)
                    .shadow(color: .black.opacity(0.3), radius: 33.97852, x: 0, y: 0).position(x: UIScreen.main.bounds.size.width / 1.95 + uiOffsetsX, y: 100 + uiOffsetsY)
                    .opacity(isGameStarted ? 1.0 : 0.0)
                    
                    // Pulsante di uscita
                    Button(action: {
                        showExitConfirmation = true // Mostra la schermata di conferma
                        isGameStarted = false
                    }) {
                        Image(systemName: "arrowshape.left")
                            .foregroundColor(.black)
                            .frame(width: 50.0, height: 50.0, alignment: .center)
                            .font(.system(size: 40))
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.56, green: 1, blue: 0.29), location: 0.00),
                                Gradient.Stop(color: .white, location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.74, y: 0.5),
                            endPoint: UnitPoint(x: -0.71, y: -0.86)
                        )
                    )
                    .cornerRadius(100)
                    .position(x: UIScreen.main.bounds.size.width - 340 + uiOffsetsX, y: 20 + uiOffsetsY)
                    
                    // Visualizza il punteggio
                    HStack(alignment: .center, spacing: 0) {
                        Text("\(score) pt")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.trailing)
                            .padding(.leading, 15.0)
                        
                    }
                    .padding(.leading, 25.0)
                    .padding(.top, 9)
                    .padding(.bottom, 8)
                    .frame(width: 120, height: 65, alignment: .center)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.48, green: 1, blue: 0.16), location: 0.00),
                                Gradient.Stop(color: .white, location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 1),
                            endPoint: UnitPoint(x: -0.07, y: -1.55)
                        )
                    )
                    .cornerRadius(100)
                    .shadow(color: .black.opacity(0.3), radius: 33.97852, x: 0, y: 0)
                    .position(x: UIScreen.main.bounds.size.width - 70 + uiOffsetsX, y: 20 + uiOffsetsY)
                    
                    // Schermata di conferma
                    if showExitConfirmation {
                        Color.black.opacity(0.7)
                            .edgesIgnoringSafeArea(.all)
                            .zIndex(1)

                        VStack(alignment: .center, spacing: 4) {
                            Text("Do you really want to quit the game?")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width: 306, height: 120)
                            Button("Cancel") {
                                showExitConfirmation = false // Chiudi la schermata di conferma
                            }.fontWeight(.bold)
                                .foregroundColor(.red)
                            .font(.title)
                            .padding(.bottom, 0.0)
                            
                            NavigationLink(destination:{
                                MainMenuExample(score: $zero)
                            }){
                                ZStack{
                                     Text("Confirm")
                                }.fontWeight(.bold)
                                    .foregroundColor(.red)
                                    .font(.title)
                            }
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 7)
                        .frame(width: 306, height: 196, alignment: .center)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: .white, location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.48, green: 1, blue: 0.16), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0, y: -1.42),
                                endPoint: UnitPoint(x: 0.79, y: 1)
                            )
                        )
                        .cornerRadius(40)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        .zIndex(2)
                    }

                    
                    if remainingTime <= 0 {
                        // Schermata nera quando il tempo scade
                        Color.black.opacity(0.7)
                            .edgesIgnoringSafeArea(.all)
                            .zIndex(1)
                        
                        VStack(alignment: .center, spacing: 4) {
                            Text("Congratulations! Point earned:")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width: 306, height: 120)
                            Text("\(score) pt")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 30.0)
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 7)
                        .frame(width: 306, height: 196, alignment: .center)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: .white, location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.48, green: 1, blue: 0.16), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0, y: -1.42),
                                endPoint: UnitPoint(x: 0.79, y: 1)
                            )
                        )
                        .cornerRadius(40)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .inset(by: 0.5)
                                .stroke(.black, lineWidth: 1)
                        ).zIndex(2)
                        
                        
                        NavigationLink(destination:{
                            MainMenuExample(score: $score)
                        }){
                            VStack{
                                Text("Go back")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 7)
                                    .frame(width: 207, height: 96, alignment: .center)
                                    .background(Color(red: 0.87, green: 0.3, blue: 0.27))
                                    .cornerRadius(40)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                    .zIndex(3)
                            }.padding(.top, 400).zIndex(3)
                        }.zIndex(3)
                        
                    }
                }
                .padding()
                
            }
            .padding()
        }.navigationBarHidden(true)
    }
    
    func spawnObjectA() {
        if isTimerRunning {
            let randomIndex = Int.random(in: 0..<trashItems.count)
            let selectedTrash = trashItems[randomIndex]
            
            // Posiziona manualmente l'oggetto A al centro dello schermo
            objectA = ObjectA(position: CGPoint(x: UIScreen.main.bounds.size.width / 1.67, y: UIScreen.main.bounds.size.height / 2 + 250), disappeared: false, trashType: selectedTrash.type)
        }
    }
    
    func spawnObjectAAfterDelay() {
        // Crea nuovamente A dopo un ritardo di 1 secondo
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.spawnObjectA()
        }
    }
    
    func startTimer() {
        isTimerRunning = true
        countdownTimer?.invalidate() // Blocca il timer esistente
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if isTimerRunning {
                if self.remainingTime > 0 {
                    self.remainingTime -= 1
                } else {
                    isTimerRunning = false
                    // Il timer è scaduto
                    self.objectA = nil
                    countdownTimer?.invalidate()
                }
            }
        }
    }
}

func distanceBetweenPoints(_ point1: CGPoint, _ point2: CGPoint) -> CGFloat {
    let deltaX = point1.x - point2.x
    let deltaY = point1.y - point2.y
    return sqrt(deltaX * deltaX + deltaY * deltaY)
}


#Preview {
    MinigameTrash()
}
