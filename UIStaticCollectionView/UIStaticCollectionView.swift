import UIKit


class UIStaticCollectionView<CellType: UIStaticCollectionViewCell>: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    typealias DataType = UIStaticCollectionViewData
    
    var data = [DataType]() {
        didSet {
            reloadData()
        }
    }
    
    override var bounds: CGRect {
        willSet(newValue) {
            if bounds.size != newValue.size {
                collectionViewLayout.invalidateLayout()
            }
        }
    }
    
    
    
    override init(frame: CGRect, collectionViewLayout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionViewLayout)
        
        register(CellType.self, forCellWithReuseIdentifier: CellType.identifier)
        
        delegate = self
        dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: CellType.identifier, for: indexPath) as! CellType
        cell.setData(data: data[indexPath.row] as! CellType.DataType)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CellType.size(frame.size)
    }
    
}
