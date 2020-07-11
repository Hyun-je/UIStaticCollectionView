import UIKit


public protocol UIStaticCollectionViewCell: UICollectionViewCell {
    
    associatedtype DataType: UIStaticCollectionViewData
    
    static var identifier: String { get }
    static var size: ((_ parentSize: CGSize) -> (CGSize)) { get }
    static var insets: ((_ parentSize: CGSize) -> (UIEdgeInsets)) { get }
    
    func setData(data: DataType)
    
}
