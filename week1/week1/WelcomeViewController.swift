import UIKit

class WelcomeViewController: UIViewController {
    
    var id: String?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "icon")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님\n반가워요"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private lazy var goToMainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        // addTarget : 버튼 클릭 시 동작을 등록 / 셀렉터에 메서드 주소 전달
        button.addTarget(self, action: #selector(backToLoginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(backToLoginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    // 셀렉터 문법은 Objective-C부터 사용하던 문법으로, @objc 키워드를 붙여야 함
    @objc
    private func backToLoginButtonDidTapped() {
        // 모달로 전환된 경우 (= 내비게이션 스택에 push되지 않은 경우)
        if self.navigationController == nil {
            // dismiss 메서드로 현재 화면을 닫음
            self.dismiss(animated: true)
            return
        }
        // 내비게이션으로 전환된 경우 (= 내비게이션 스택에 push된 경우) -> 스택에 쌓인 이전 뷰 컨트롤러를 pop
        // +) 현재 root로 설정된 LoginViewController는 pop되지 않음
        self.navigationController?.popViewController(animated: true)
    }
    
    private func bindID() {
        if id != nil {
            titleLabel.text = "\(id!)님 \n반가워요!"
        }
        titleLabel.text = "???님 \n반가워요!"
    }
    
    // 데이터 전달
    func setLabelText(id: String?) {
        self.id = id
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        bindID()
    }
    
    private func setLayout() {
        let elements: [UIView] = [imageView, titleLabel, goToMainButton, backToLoginButton]
        elements.forEach {
            self.view.addSubview($0)
        }
    }
}
