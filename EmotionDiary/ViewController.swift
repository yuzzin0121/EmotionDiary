//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 조유진 on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet var emotionButtons: [UIButton]!
 
    @IBOutlet var emotionNameLabels: [UILabel]!
    let emotionNames = ["좋아해", "행복해", "사랑해", "화가나", "그냥그래", "피곤해", "긴장돼", "속상해", "슬퍼"]
    
    // TODO: - 감정 횟수가 영구적으로 유지되도록 설정
    var clickCounts = [UserDefaults.standard.integer(forKey: "Button0Count"),
                       UserDefaults.standard.integer(forKey: "Button1Count"),
                       UserDefaults.standard.integer(forKey: "Button2Count"),
                       UserDefaults.standard.integer(forKey: "Button3Count"),
                       UserDefaults.standard.integer(forKey: "Button4Count"),
                       UserDefaults.standard.integer(forKey: "Button5Count"),
                       UserDefaults.standard.integer(forKey: "Button6Count"),
                       UserDefaults.standard.integer(forKey: "Button7Count"),
                       UserDefaults.standard.integer(forKey: "Button8Count"),
                       UserDefaults.standard.integer(forKey: "Button9Count")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()
        designImageView(backgroundImageView, image: UIImage(named: "background") ?? nil)
        
        for index in 0...emotionButtons.count - 1 {
            designButton(emotionButtons[index], image: UIImage(named: "slime\(index+1)"))   // 버튼 이미지 디자인
            // 버튼 label 설정
            setEmotionLabelName(emotionNameLabels[index], emotionName: emotionNames[index] , count: clickCounts[index])
        }
    }
    
    // 감정 버튼을 클릭했을 때
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        let index = sender.tag  // 버튼의 태그를 통해 인덱스 가져오기
        
        var count = UserDefaults.standard.integer(forKey: "Button\(index)Count")
        count = count + 1
        setEmotionLabelName(emotionNameLabels[index], emotionName: emotionNames[index], count: count)
        
        UserDefaults.standard.set(count, forKey: "Button\(index)Count")
    }
    
    // 레이블 텍스트 설정
    func setEmotionLabelName(_ emotionLabel: UILabel, emotionName: String, count: Int) {
        emotionLabel.text = "\(emotionName) \(count)"
    }
    
    // MARK: - 랜덤
    
    // 클릭 개수 랜덤 설정
    func setLabelRandomCount(_ label: UILabel) {
        let randomInt = getRandomInt()
        label.text = "\(randomInt)"
    }
    
    // 랜덤 수 가져오기
    func getRandomInt() -> Int {
        return Int.random(in: 1...99)
    }
    
    // MARK: - 디자인
    
    // 네비게이션 아이템 디자인
    func setNavigationItem() {
        navigationItem.title = "감정 다이어리"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: nil)
    }

    // 이미지뷰 디자인
    func designImageView(_ imageView: UIImageView, image: UIImage?) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
    }
    
    // 버튼 디자인
    func designButton(_ button: UIButton, image: UIImage?) {
        button.setImage(image, for: .normal)
    }
}

