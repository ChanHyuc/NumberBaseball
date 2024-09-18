import Foundation

private func selectGameMenu() {
    while true {
        print("1. 게임 시작")
        print("2. 게임 종료")
        print("원하는 기능을 선택해 주세요", terminator: " : ")
        
        guard let inputMenu = readLine()?.trimmingCharacters(in: .whitespaces) else { return }
        
        switch inputMenu {
        case "1":
            playGame()
        case "2":
            break
        default:
            print("입력이 잘못되었습니다")
        }
        
    }
}

private func makeRandomNumber() -> [Int] {
    let shuffleNumber = Array(1...9).shuffled()
    return Array(shuffleNumber.prefix(3))
}

private func getInput() -> [Int]? {
    print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
    print("중복 숫자는 허용하지 않습니다.")
    print("입력 숫자", terminator: " : ")
    
    guard let input = readLine() else { return nil }
    
    if input.components(separatedBy: " ").joined().range(of: "^[1-9]{3,3}$", options: .regularExpression) == nil {
        print("\n입력이 잘못 되었습니다 \n")
        return nil
    }
    
    
    return input.split(separator: " ").compactMap({ Int($0) })
}

private func excuteGameLogic(numberArr: [Int], inputNumbers: [Int]) -> (Int, Int) {
    var strike = 0, ball = 0
    
    for index in 0...2 {
        if numberArr[index] == inputNumbers[index] {
            strike += 1
        } else if numberArr.contains(inputNumbers[index]) {
            ball += 1
        }
    }
    
    return (strike, ball)
}

private func playGame() {
    let numberArr = makeRandomNumber()
    var life = 10
    
    print("게임 시작!")
    
    while life != 0 {
        guard let userInput = getInput() else { continue }
        
        let (strike, ball) = excuteGameLogic(numberArr: numberArr, inputNumbers: userInput)
        
        if strike == 3 {
            print("사용자의 승리!!! \n")
            return
        }
        
        life -= 1
        print("\(strike) 스트라이크, \(ball) 볼")
        print("남은 기회 : \(life)")
    }
    
    print("컴퓨터의 승리! 정답은 \(numberArr) 입니다!\n")
}
