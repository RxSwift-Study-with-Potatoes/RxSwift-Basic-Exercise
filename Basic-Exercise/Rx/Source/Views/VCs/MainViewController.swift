//
//  MainViewController.swift
//  Rx
//
//  Created by taehy.k on 2021/08/31.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var yiJoonView: UIView!
    @IBOutlet weak var jiWonView: UIView!
    @IBOutlet weak var taeHyeonView: UIView!
    @IBOutlet weak var hyeRyeongView: UIView!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    // MARK: - Configure

    private func setUI() {
        navigationController?.navigationBar.isHidden = true
        [yiJoonView, jiWonView, taeHyeonView, hyeRyeongView].forEach {
            $0?.makeRounded(cornerRadius: 30)
        }
    }
    
    // MARK: - Actions
    
    /// 지원 뷰 컨트롤러로 이동
    @IBAction func moveToJiWonView(_ sender: Any) {
        guard let jiWonVC = storyboard?.instantiateViewController(identifier: "ViewController") else { return }
        navigationController?.pushViewController(jiWonVC, animated: true)
    }
    
}
