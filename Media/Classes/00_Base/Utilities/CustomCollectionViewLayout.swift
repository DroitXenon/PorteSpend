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
class CustomCollectionViewLayout: UICollectionViewLayout {

	let cellHeight = 66.0
	let cellWidth = Double(UIScreen.main.bounds.size.width * 0.80)
	var cellAttrsDictionary: [IndexPath: UICollectionViewLayoutAttributes] = [:]
	var contentSize = CGSize.zero

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override var collectionViewContentSize : CGSize {
		return self.contentSize
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func prepare() {

		var columnCounter = 0
		var cellCounter = 0

		if let sectionCount = collectionView?.numberOfSections, sectionCount > 0 {
			for section in 0...sectionCount-1 {
				if let rowCount = collectionView?.numberOfItems(inSection: section), rowCount > 0 {
					for item in 0...rowCount-1 {
						let cellIndex = IndexPath(item: item, section: section)
						let xPos = Double(columnCounter) * cellWidth
						let yPos = Double(cellCounter) * cellHeight
						if cellCounter == 2 {
							cellCounter = 0
							columnCounter += 1
						}
						else {
							cellCounter += 1
						}
						let cellAttributes = UICollectionViewLayoutAttributes(forCellWith: cellIndex)
						cellAttributes.frame = CGRect(x: xPos, y: yPos, width: cellWidth, height: cellHeight)
						cellAttrsDictionary[cellIndex] = cellAttributes
					}
				}
			}
		}
		let contentWidth = (Double(columnCounter + 1) * cellWidth) + 30.0
		let contentHeight = Double(3) * cellHeight
		self.contentSize = CGSize(width: contentWidth, height: contentHeight)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

		var attributesInRect: [UICollectionViewLayoutAttributes] = []
		for cellAttributes in cellAttrsDictionary.values {
			if rect.intersects(cellAttributes.frame) {
				attributesInRect.append(cellAttributes)
			}
		}
		return attributesInRect
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {

		return cellAttrsDictionary[indexPath]
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {

		return true
	}
}
