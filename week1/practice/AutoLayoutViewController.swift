import UIKit

class AutoLayoutViewController: UIViewController {
    
    var yellowBox: UIView = {
        let yellowBoxView = UIView()
        yellowBoxView.backgroundColor = .yellow
        return yellowBoxView
    }()
    
    var greenBox: UIView = {
        let greenBoxView = UIView()
        greenBoxView.backgroundColor = .green
        return greenBoxView
    }()
    
    var blackBox: UIView = {
        let blackBoxView = UIView()
        blackBoxView.backgroundColor = .black
        return blackBoxView
    }()
    
    var blueBox: UIView = {
        let blueBoxView = UIView()
        blueBoxView.backgroundColor = .blue
        return blueBoxView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        [yellowBox, greenBox, blackBox, blueBox].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        

        setLayout()
    }
    
    func setLayout() {
        let width = UIScreen.main.bounds.width / 2
        let height = UIScreen.main.bounds.height / 4

        NSLayoutConstraint.activate([yellowBox.topAnchor.constraint(equalTo: view.topAnchor),
                                     yellowBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     yellowBox.widthAnchor.constraint(equalToConstant: width),
                                     yellowBox.heightAnchor.constraint(equalToConstant: height)])
        
        NSLayoutConstraint.activate([greenBox.topAnchor.constraint(equalTo: yellowBox.bottomAnchor),
                                     greenBox.leadingAnchor.constraint(equalTo: yellowBox.trailingAnchor),
                                     greenBox.widthAnchor.constraint(equalToConstant: width),
                                     greenBox.heightAnchor.constraint(equalToConstant: height)])
        
        NSLayoutConstraint.activate([blackBox.topAnchor.constraint(equalTo: greenBox.bottomAnchor),
                                     blackBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     blackBox.widthAnchor.constraint(equalToConstant: width),
                                     blackBox.heightAnchor.constraint(equalToConstant: height)])
        
        NSLayoutConstraint.activate([blueBox.topAnchor.constraint(equalTo: blackBox.bottomAnchor),
                                     blueBox.leadingAnchor.constraint(equalTo: blackBox.trailingAnchor),
                                     blueBox.widthAnchor.constraint(equalToConstant: width),
                                     blueBox.heightAnchor.constraint(equalToConstant: height)])
    }
}
