import UIKit

class ScrollViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var contentView = UIView()
    
    var redView = UIView()
    var orangeView = UIView()
    var yellowView = UIView()
    var greenView = UIView()
    var blueView = UIView()
    var purpleView = UIView()
    
    private func setLayout() {
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        purpleView.backgroundColor = .purple
        
        [scrollView, contentView, redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
        ])
        
        let height = UIScreen.main.bounds.height / 2
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: contentView.topAnchor),
            redView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            redView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            redView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            redView.heightAnchor.constraint(equalToConstant: height),
            
            orangeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            orangeView.leadingAnchor.constraint(equalTo: redView.trailingAnchor),
            orangeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            orangeView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            orangeView.heightAnchor.constraint(equalToConstant: height),
            
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor),
            yellowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yellowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            yellowView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            yellowView.heightAnchor.constraint(equalToConstant: height),
            
            greenView.topAnchor.constraint(equalTo: orangeView.bottomAnchor),
            greenView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor),
            greenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            greenView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            greenView.heightAnchor.constraint(equalToConstant: height),
            
            blueView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blueView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            blueView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            blueView.heightAnchor.constraint(equalToConstant: height),
            blueView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            purpleView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            purpleView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor),
            purpleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            purpleView.heightAnchor.constraint(equalToConstant: height),
            purpleView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            purpleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }
}
