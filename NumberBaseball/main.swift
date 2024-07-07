private var life = 10
private var inputMenu = ""

private func gameMenu() {
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

gameMenu()
