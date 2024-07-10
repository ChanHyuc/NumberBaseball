private func makeRandomNumber() -> [Int] {
    var numberSet = Set<Int>()
    
    while numberSet.count < 3 {
        let randomNumber = Int.random(in: 1...9)
        numberSet.insert(randomNumber)
    }
    return Array(numberSet)
}

private func playGame() {
    let numberArr = makeRandomNumber()
    var life = 10
    
    print("게임 시작!")
    
    while life != 0 {
        var strike = 0, ball = 0
        
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
        print("입력 숫자", terminator: " : ")
        
        guard let input = readLine() else { return }
        let inputNumbers = input.split(separator: " ").compactMap({ Int($0) })
        
        if inputNumbers.count != 3 {
            print("입력이 잘못 되었습니다")
            continue
        }
        
        for i in 0...2 {
            if numberArr[i] == inputNumbers[i] {
                strike += 1
            } else if numberArr.contains(inputNumbers[i]) {
                ball += 1
            }
        }
        
        if strike == 3 {
            print("사용자의 승리!!!")
            return
        }
        
        life -= 1
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(life)")
    }
    
    print("컴퓨터의 승리!")
}


private func printGameMenu() {
    var inputMenu = ""
    
    while inputMenu != "2" {
        print("1. 게임 시작")
        print("2. 게임 종료")
        print("원하는 기능을 선택해 주세요", terminator: " : ")
        
        guard let input = readLine() else { return }
        inputMenu = input
        
        if inputMenu == "1" {
            playGame()
        }
        
    }
}

printGameMenu()
