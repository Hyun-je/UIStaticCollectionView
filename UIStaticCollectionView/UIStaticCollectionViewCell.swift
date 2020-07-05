import UIKit


public protocol UIStaticCollectionViewCell: UICollectionViewCell {
    
    associatedtype DataType: UIStaticCollectionViewData
    
    static var identifier: String { get }
    static var size: ((_ parentSize: CGSize) -> (CGSize)) { get }
    
    func setData(data: DataType)
    
}
