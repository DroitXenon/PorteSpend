//
// Copyright (c) 2021 Related Code - https://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
protocol Profile3LayoutDelegate: class {

	func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat
}

//-----------------------------------------------------------------------------------------------------------------------------------------------
class Profile3Layout: UICollectionViewLayout {

	weak var delegate: Profile3LayoutDelegate!
	fileprivate var numberOfColumns = 2
	fileprivate var cellPadding: CGFloat = 7.5
	fileprivate var cache = [UICollectionViewLayoutAttributes]()
	fileprivate var contentHeight: CGFloat = 0

	fileprivate var contentWidth: CGFloat {
		guard let collectionView = collectionView else {
			return 0
		}
		let insets = collectionView.contentInset
		return collectionView.bounds.width - (insets.left + insets.right)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override var collectionViewContentSize: CGSize {

		return CGSize(width: contentWidth, height: contentHeight)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func prepare() {

		guard cache.isEmpty == true, let collectionView = collectionView else {
			return
		}

		let columnWidth = contentWidth / CGFloat(numberOfColumns)
		var xOffset = [CGFloat]()
		for column in 0 ..< numberOfColumns {
			xOffset.append(CGFloat(column) * columnWidth)
		}
		var column = 0
		var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)


		for item in 0 ..< collectionView.numberOfItems(inSection: 0) {

			let indexPath = IndexPath(item: item, section: 0)


			let photoHeight = delegate.collectionView(collectionView, heightForPhotoAtIndexPath: indexPath)
			let height = cellPadding * 2 + photoHeight
			let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
			let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)


			let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
			attributes.frame = insetFrame
			cache.append(attributes)


			contentHeight = max(contentHeight, frame.maxY)
			yOffset[column] = yOffset[column] + height

			column = column < (numberOfColumns - 1) ? (column + 1) : 0
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

		var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()

		for attributes in cache {
			if attributes.frame.intersects(rect) {
				visibleLayoutAttributes.append(attributes)
			}
		}
		return visibleLayoutAttributes
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func invalidateLayout() {

		super.invalidateLayout()
		cache.removeAll()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {

		return cache[indexPath.item]
	}
}
