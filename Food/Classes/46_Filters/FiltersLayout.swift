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
class FiltersCollectionViewFlowLayout: UICollectionViewFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

		let attributes = super.layoutAttributesForElements(in: rect)

		var leftMargin = sectionInset.left
		var maxY: CGFloat = -1.0
		attributes?.forEach { layoutAttribute in
			if layoutAttribute.frame.origin.y >= maxY {
				leftMargin = sectionInset.left
			}

			layoutAttribute.frame.origin.x = leftMargin

			leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
			maxY = max(layoutAttribute.frame.maxY , maxY)
		}

		return attributes
	}
}
