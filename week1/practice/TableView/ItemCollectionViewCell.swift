import UIKit

protocol ItemCollectionViewCellDelegate: AnyObject {
    func heartButtonDidTapEvent(state: Bool, row: Int)
}

class ItemCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ItemCollectionViewCellDelegate?
    private var itemRow: Int = 0
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        //button.setImage(UIImage(named: "heart_fill"), for: .selected)
        button.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func heartButtonTapped() {
        heartButton.isSelected.toggle()
        delegate?.heartButtonDidTapEvent(state: heartButton.isSelected, row: itemRow)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [itemImageView, nameLabel, priceLabel, heartButton].forEach {
            contentView.addSubview($0)
        }
        
        itemImageView.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.width.height.equalTo(139)
        }
        
        heartButton.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.top).offset(8)
            $0.trailing.equalTo(itemImageView.snp.trailing).offset(-8)
            $0.width.height.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
    }
    
    func dataBind(_ itemData: ItemModel, itemRow: Int) {
        self.itemRow = itemRow
        itemImageView.image = itemData.itemImg
        nameLabel.text = itemData.name
        priceLabel.text = itemData.price
        heartButton.isSelected = itemData.heartIsSelected
    }
}
