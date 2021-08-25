//
//  ObservableViewController.swift
//  Rx
//
//  Created by JEN Lee on 2021/08/25.
//

import UIKit
import RxSwift

class ObservableViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func ofClicked(_ sender: Any) {
        //ㅈㅅ 함수이름 바뀜,,,just임
        
        let observable1 = Observable.just(1)
        //let observable2 = Observable.just([1,2,3])
        observable1.subscribe { event in
            print(event)
        }.disposed(by: disposeBag)

    }
    
    @IBAction func justClicked(_ sender: Any) {
        //함수이름은 just지만 of랍니다?
        
        let observable2 = Observable.of(1, 2, 3)

        observable2.subscribe { event in
            print(event)
        }.disposed(by: disposeBag)

        let observable3 = Observable.of([1, 2, 3])

        observable3.subscribe { event in
            print(event)
        }.dispose()

    }
    
    
    @IBAction func fromClicked(_ sender: Any) {
        
        //of 랑 차이점 보기
        
        let observable4 = Observable.from([1, 2, 3, 4, 5])

        observable4.subscribe { event in
            print(event)
        }

        observable4.subscribe { event in
            if let element = event.element {
                print(element)
            }
        }

    }
    
    
    @IBAction func rangeClicked(_ sender: Any) {
        
        let _ = Observable<Int>.range(start: 3, count: 6).subscribe { event in
            print(event)
        }
        
    }
    
    
    
    

    

}
