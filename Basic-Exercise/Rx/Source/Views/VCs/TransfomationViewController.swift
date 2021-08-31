//
//  TransfomationViewController.swift
//  Rx
//
//  Created by JEN Lee on 2021/08/25.
//

import UIKit
import RxSwift
import RxCocoa

class TransfomationViewController: UIViewController {

    let disposeBag = DisposeBag()
    @IBOutlet var myButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func toArray(_ sender: Any) {
        Observable
            .of(1,2,3)
            .toArray()
            .subscribe({
                print($0)
            })
            .disposed(by: disposeBag)

    }
    
    @IBAction func map(_ sender: Any) {
        Observable
            .of(1,2,3)
            .map{
                $0 * 2
            }
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
//        let skills = ["Swift", "SwiftUI", "RxSwift"]
//        Observable.from(skills)
//            .map { $0.count }
//            .subscribe{ print($0) }
//            .disposed(by: disposeBag)
        
    }
    
    @IBAction func flatMap(_ sender: Any) {
        
        struct Student {
            var score: BehaviorSubject<Int>
        }
        
        let ryan = Student(score: BehaviorSubject(value: 80))
        let charlotte = Student(score: BehaviorSubject(value: 90))
        
        let student = PublishSubject<Student>()
        
        student
            .flatMap{
                $0.score
            }
            
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        
        print("flatMap")
        
        student.onNext(ryan)    // Printed: 80
        
        ryan.score.onNext(85)   // Printed: 80 85
        
        student.onNext(charlotte)   // Printed: 80 85 90
        
        ryan.score.onNext(95)   // Printed: 80 85 90 95
        
        charlotte.score.onNext(100) // Printed: 80 85 90 95 100
        
        //1. 두 학생 객체 생성, 각 score를 갖는 BehaviorSubject객체로 초기화
        
        //2. 바로 전의 두 학생 객체의 score에 대한 이벤트를 처리하기 위해 PublishSubject객체 생성

        //3. student시퀀스를 score값을 기준으로 flatMap 변환

        //4. 변환된 시퀀스에 구독 요청 및 이벤트 print()
    }
    
    
    @IBAction func flatMapLatest(_ sender: Any) {

        struct Student {
            var score: BehaviorSubject<Int>
        }
        
          let laura = Student(score: BehaviorSubject(value: 80))
          let charlotte = Student(score: BehaviorSubject(value: 90))

          let student = PublishSubject<Student>()

          student
            .flatMapLatest {
              $0.score
            }
            .subscribe(onNext: {
              print($0)
            })
            .disposed(by: disposeBag)
        
        print("flatMapLatest")

          student.onNext(laura) // print : 80
          laura.score.onNext(85) // print : 85
          student.onNext(charlotte) // print : 90

          laura.score.onNext(95) // print : none
          charlotte.score.onNext(100) // print : 100
    }
    
    @IBAction func buffer(_ sender: Any) {
        
        Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
            .buffer(timeSpan: .seconds(2), count: 3, scheduler: MainScheduler.instance)
            .take(5)
            .subscribe{ print($0) }
            .disposed(by: disposeBag)

    }
    
    @IBAction func windo(_ sender: Any) {
        
        Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
            .window(timeSpan: .seconds(2), count: 3, scheduler: MainScheduler.instance)
            .take(5)
            .subscribe{
                print($0)
                
                if let observable = $0.element {
                    observable.subscribe { print("inner : \($0)") }
                }
        }
            .disposed(by: disposeBag)

    }
    
    @IBAction func groupBy(_ sender: Any) {
        
        let words = ["Apple","Banana","Orange","Book","City","Axe"]

        // 첫번째 문자로 그룹핑
        Observable.from(words)
            .groupBy { $0.first }
            .flatMap{ $0.toArray() }
            .subscribe{ print($0) }
            .disposed(by: disposeBag)

        //홀수 짝수로 그룹핑
//        Observable.range(start: 1, count: 10)
//            .groupBy{ $0.isMultiple(of: 2) }
//            .flatMap{ $0.toArray() }
//            .subscribe{ print($0) }
//            .disposed(by: disposeBag)
//
        
    }
    
    
    @IBAction func scan(_ sender: Any) {
        Observable.range(start: 1, count: 10)
            .scan(0, accumulator: +)
            .subscribe{ print($0) }
            .disposed(by: disposeBag)
        
        
    }
    
    
    
}

