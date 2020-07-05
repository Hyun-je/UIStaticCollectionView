import UIKit


public class UIStaticCollectionView<CellType: UIStaticCollectionViewCell>: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public typealias DataType = UIStaticCollectionViewData
    
    public var data = [DataType]() {
        didSet {
            reloadData()
        }
    }
    
    public override var bounds: CGRect {
        willSet(newValue) {
            if bounds.size != newValue.size {
                collectionViewLayout.invalidateLayout()
            }
        }
    }
    
    
    
    public override init(frame: CGRect, collectionViewLayout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionViewLayout)
        
        register(CellType.self, forCellWithReuseIdentifier: CellType.identifier)
        
        delegate = self
        dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: CellType.identifier, for: indexPath) as! CellType
        cell.setData(data: data[indexPath.row] as! CellType.DataType)
        return cell
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CellType.size(frame.size)
    }
    
}
