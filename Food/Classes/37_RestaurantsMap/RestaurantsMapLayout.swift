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
class RestaurantsMapPagingCollectionViewLayout: UICollectionViewFlowLayout {

	private var velocityThresholdPerPage: CGFloat = 2
	private var numberOfItemsPerPage: CGFloat = 1

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {

		guard let collectionView = collectionView else { return proposedContentOffset }

		let pageLength: CGFloat
		let approxPage: CGFloat
		let currentPage: CGFloat
		let speed: CGFloat

		if scrollDirection == .horizontal {
			pageLength = (itemSize.width + minimumLineSpacing) * numberOfItemsPerPage
			approxPage = collectionView.contentOffset.x / pageLength
			speed = velocity.x
		} else {
			pageLength = (itemSize.height + minimumLineSpacing) * numberOfItemsPerPage
			approxPage = collectionView.contentOffset.y / pageLength
			speed = velocity.y
		}

		if speed < 0 {
			currentPage = ceil(approxPage)
		} else if speed > 0 {
			currentPage = floor(approxPage)
		} else {
			currentPage = round(approxPage)
		}

		guard speed != 0 else {
			if scrollDirection == .horizontal {
				return CGPoint(x: currentPage * pageLength, y: 0)
			} else {
				return CGPoint(x: 0, y: currentPage * pageLength)
			}
		}

		var nextPage: CGFloat = currentPage + (speed > 0 ? 1 : -1)

		let increment = speed / velocityThresholdPerPage
		nextPage += (speed < 0) ? ceil(increment) : floor(increment)

		if scrollDirection == .horizontal {
			return CGPoint(x: nextPage * pageLength, y: 0)
		} else {
			return CGPoint(x: 0, y: nextPage * pageLength)
		}
	}
}
