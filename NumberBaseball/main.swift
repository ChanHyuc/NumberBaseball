private var life = 10
private var inputMenu = ""

private func makeRandomNumber() -> [Int] {
    var numberSet = Set<Int>()
    
    while numberSet.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        numberSet.insert(randomNumber)
    }
    
    let numberArr = Array(numberSet)
    
    return numberArr
}


private func printGameMenu() {
    while inputMenu != "2" {
        print("1. 게임 시작")
        print("2. 게임 종료")
        print("원하는 기능을 선택해 주세요", terminator: " : ")
        
        guard let input = readLine() else {
            return
        }
        inputMenu = input
    }
}

printGameMenu()
