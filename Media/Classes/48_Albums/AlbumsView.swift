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
class AlbumsView: UIViewController {

	@IBOutlet var viewHeader: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var constraintCollectionViewHeight: NSLayoutConstraint!

	private var navigationBackgroundImage: UIImage?
	private var albums: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: setupSortByButton())

		collectionView.register(UINib(nibName: "AlbumsCell", bundle: nil), forCellWithReuseIdentifier: "AlbumsCell")

		loadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		constraintCollectionViewHeight.constant = collectionView.contentSize.height
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
	}

	// MARK: - Navigation methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setupSortByButton() -> UIButton {

		let imageAttachment = NSTextAttachment()
		imageAttachment.image = UIImage(systemName: "arrow.up.arrow.down")?.withTintColor(AppColor.Theme)
		imageAttachment.bounds = CGRect(x: 0, y: -3, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)

		let attachmentString = NSAttributedString(attachment: imageAttachment)
		let completeText = NSMutableAttributedString(string: "Sort by")
		let spaceText = NSMutableAttributedString(string: " ")
		completeText.append(spaceText)

		completeText.append(attachmentString)
		completeText.addAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], range: NSRange(location: 0, length: 7))

		let button = UIButton()
		button.setAttributedTitle(completeText, for: .normal)
		button.addTarget(self, action: #selector(actionSortBy), for: .touchUpInside)
		return button
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelSubTitle.text = "4 albums"

		albums.removeAll()

		var dict1: [String: String] = [:]
		dict1["song"] = "Freedom"
		dict1["artist"] = "Akon"
		albums.append(dict1)

		var dict2: [String: String] = [:]
		dict2["song"] = "No Roots - EP"
		dict2["artist"] = "Alice Merton"
		albums.append(dict2)

		var dict3: [String: String] = [:]
		dict3["song"] = "Funk Wav Bounces"
		dict3["artist"] = "Calvin Harris"
		albums.append(dict3)

		var dict4: [String: String] = [:]
		dict4["song"] = "A Head Full of Dreams"
		dict4["artist"] = "Coldplay"
		albums.append(dict4)

		albums.append(dict1)
		albums.append(dict2)

		refreshCollectionView()

		collectionView.layoutIfNeeded()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSortBy() {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}
}

// MARK: - UIScrollViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AlbumsView: UIScrollViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if scrollView.contentOffset.y > viewHeader.frame.origin.y {
			navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
			title = labelTitle.text
		}
		else {
			navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
			title = ""
		}
	}
}

// MARK:- UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AlbumsView: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return albums.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumsCell", for: indexPath) as! AlbumsCell
		cell.bindData(index: indexPath.item, data: albums[indexPath.row])
		return cell
	}
}

// MARK:- UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AlbumsView: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK:- UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AlbumsView: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let screenRect: CGRect = UIScreen.main.bounds
		let screenHeight: CGFloat = screenRect.size.height
		let screenWidth: CGFloat = screenRect.size.width

		return CGSize(width: (screenWidth - 40)/2, height: screenHeight / 3.2)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 10
	}
}
