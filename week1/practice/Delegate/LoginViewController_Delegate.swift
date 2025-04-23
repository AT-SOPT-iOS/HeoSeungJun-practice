import UIKit

class LoginViewController_Delegate: UIViewController, DataBindDelegate {
    
    func dataBind(id: String) {
        passwordTextField.text = id
    }
    
    private let titleLabel: UILabel = {
        // 생성자에서 CGRect 타입의 frame 속성을 지정할 수 있다
        let label = UILabel(frame: CGRect(x: 54, y: 163, width: 236, height: 42))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-Regular", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 3
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 52))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-Regular", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 3
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 52))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func loginButtonDidTapped() {
        //presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Delegate()
        welcomeViewController.modalPresentationStyle = .formSheet
        
        //welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: idTextField.text)    // 캡슐화, 의도 표현에 장점
        
        // present : 현재 뷰 컨트롤러에서 새로운 뷰 컨트롤러를 모달로 표시하는 방식
        // present(_ viewControllerToPresent, animated flag: Bool, completion: (() -> Void)? = nil)
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Delegate()
        
        //welcomeViewController.id = idTextField.text
        welcomeViewController.delegate = self
        welcomeViewController.setLabelText(id: idTextField.text)
        
        // pushViewController : 내비게이션 스택에 새로운 뷰 컨트롤러(WelcomeViewController)를 push
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    // viewDidLoad : 뷰 컨트롤러 실행 시 가장 먼저 호출되는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        let elements: [UIView] = [titleLabel, idTextField, passwordTextField, loginButton]
        elements.forEach {
            self.view.addSubview($0)
        }
    }
}
