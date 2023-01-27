
import Foundation

//Практическое задание: Используя инструменты ООП написать программу "Кто хочет стать миллионером" Как должна проходить игра. Программа должна запросить имя пользователя, вы вводите и начинаете играть до первого неправильного ответа, за каждый ответ начисляются очки. Результаты всех пользователей сохранять в массив историй. Вопросы и о тветы заполните сами. Реализация произвольная. Попытайтесь, это не итоговое тестирование, проверьте себя!

var history: [Player] = []


class Quastion{
    var rightAnswer: String
    var A: String
    var B: String
    var C: String
    var D: String
    var question: String
    init(rightAnswer: String, A: String, B: String, C: String, D: String, question: String) {
        self.rightAnswer = rightAnswer
        self.A = A
        self.B = B
        self.C = C
        self.D = D
        self.question = question
    }
}



class Player{
    var name: String
    var surname: String
    var answers: [String]
    var result: Int //сколько заработал за 1 игру
    init(name: String, surname: String, answers: [String], result: Int) {
        self.name = name
        self.surname = surname
        self.answers = answers
        self.result = result
    }
    func showInfo(){
        print("\(name), \(surname), \(answers), \(result)")
    }
}

var questions: [Quastion] = [
    Quastion(rightAnswer: "B", A: "A) Рауль", B: "B) Ислам", C: "C) Максим", D: "D) Руслан", question: "Как меня зовут?"),
    Quastion(rightAnswer: "D", A: "A) Руслан", B: "B) Нурсултан", C: "C) Рамазан", D: "D) Нурсеид", question: "Кто был нашим преподавателем на 1-ом месяце?"),
    Quastion(rightAnswer: "C", A: "A) 5", B: "B) 3", C: "C) 8", D: "D) 7", question: "Сколько областей в кр?"),
    Quastion(rightAnswer: "A", A: "A) Иссык-Куль", B: "B) Джалал-Абад", C: "C) Нарын", D: "D) Чуй", question: "В каком регионе находится озеро Иссык-Куль?")
]

func whoWantsToBeABillionaire () {
    print("Добро пожаловать в игру Миллионер")
    print("Напишите свое имя")
    var nameReadline = readLine()!
    print("Напишите свою фамилию")
    var surnameReadline = readLine()!
    
    
    var money = 0
    
    let player = Player(name: nameReadline, surname: surnameReadline, answers: [], result: money)
    
    for question in questions {
        print(question.question)
        print(question.A)
        print(question.B)
        print(question.C)
        print(question.D)

        let userAnswer = readLine()!
        player.answers.append(userAnswer)
        
        if userAnswer == question.rightAnswer {
            money += 1000
            player.result = money
            //выводишь в консоль что правильный ответ
            continue
        } else {
            print("Неправильно!")
            
            history.append(player)
            print("История игроков: ")
            for player in history {
                player.showInfo()
            }
            break
        }
    }
    
    //начать игру с другим игроком?
    print("Продолжить? (да/нет)")
    let answer = readLine()!
    
    if answer == "да"{
        whoWantsToBeABillionaire()
    } else {
        print("Игра закончилась!")
    }
}


whoWantsToBeABillionaire()
