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
class Story2Cell1: UICollectionViewCell {

	@IBOutlet var layoutConstraintTop: NSLayoutConstraint!
	@IBOutlet var layoutConstraintBottom: NSLayoutConstraint!
	@IBOutlet var imageStatus: UIImageView!
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var buttonSend: UIButton!
	@IBOutlet var buttonMore: UIButton!

	private var stories = 0
	private var currentStoryIndex = 0
	var nextUserStoryBlock: (()->())?
	var prevUserStoryBlock: (()->())?
	var ViewSafeAreaInsets = UIEdgeInsets.zero

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		collectionView.register(UINib(nibName: "Story2Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Story2Cell2")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func prepareForReuse() {

		super.prepareForReuse()
		currentStoryIndex = 0
		collectionView.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: Any]) {

		layoutConstraintTop.constant = ViewSafeAreaInsets.top
		layoutConstraintBottom.constant = ViewSafeAreaInsets.bottom

		guard let name = data["name"] as? String else { return }
		guard let time = data["time"] as? String else { return }
		guard let storyCount = data["storyCount"] as? Int else { return }

		imageStatus.sample("Social", "Weddings", 0)
		imageUser.sample("Social", "Family", 3)
		labelName.text = name
		labelTime.text = time
		stories = storyCount
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPrevStory(_ sender: UITapGestureRecognizer) {

		print(#function)
		if (currentStoryIndex > 0) {
			currentStoryIndex -= 1
			collectionView.reloadData()
		} else {
			if let block = prevUserStoryBlock {
				block()
			}
		}
		imageStatus.sample("Social", "Weddings", currentStoryIndex)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionNextStory(_ sender: UITapGestureRecognizer) {

		print(#function)
		if (currentStoryIndex < stories-1) {
			currentStoryIndex += 1
			collectionView.reloadData()
		} else {
			if let block = nextUserStoryBlock {
				block()
			}
		}
		imageStatus.sample("Social", "Weddings", currentStoryIndex)
	}
}

// MARK: - UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Story2Cell1: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return stories
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Story2Cell2", for: indexPath) as! Story2Cell2
		cell.bindData(progress: (indexPath.row<currentStoryIndex) ? 1.0 : 0.0)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Story2Cell1: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Story2Cell1: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = collectionView.frame.size.width/CGFloat(stories)-3
		return CGSize(width: width, height: collectionView.frame.size.height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets.zero
	}
}
