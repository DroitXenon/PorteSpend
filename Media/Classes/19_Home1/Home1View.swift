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
class Home1View: UIViewController {

	@IBOutlet var collectionView1: UICollectionView!
	@IBOutlet var collectionView2: UICollectionView!
	@IBOutlet var collectionView3: UICollectionView!

	private var categories = ["Music", "TV series", "Videos"]
	private var videos1: [[String: String]] = []
	private var videos2: [[String: String]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Home"

		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(actionMenu))
		navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(actionAdd)), UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(actionSearch))]

		collectionView1.register(UINib(nibName: "Home1Cell1", bundle: nil), forCellWithReuseIdentifier: "Home1Cell1")
		collectionView2.register(UINib(nibName: "Home1Cell2", bundle: nil), forCellWithReuseIdentifier: "Home1Cell2")
		collectionView3.register(UINib(nibName: "Home1Cell2", bundle: nil), forCellWithReuseIdentifier: "Home1Cell2")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		videos1.removeAll()
		videos2.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "AC/DC - Thunderstruck (Official Video)"
		dict1["views"] = "466M views · 5 years ago"
		dict1["type"] = "AC/DC Official"
		videos1.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Evanescence - My Immortal)"
		dict2["views"] = "510M views · 8 years ago"
		dict2["type"] = "Evanescence"
		videos1.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Call Me - Shinedown Lyrics"
		dict3["views"] = "466M views · 5 years ago"
		dict3["type"] = "AC/DC Official"
		videos2.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Shinedown - 45 (Official Music Video)"
		dict4["views"] = "510M views · 8 years ago"
		dict4["type"] = "Evanescence"
		videos2.append(dict4)

		videos1.append(dict3)
		videos1.append(dict4)

		videos2.append(dict1)
		videos2.append(dict2)

		refreshCollectionView2()
		refreshCollectionView3()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu() {

		dismiss(animated: true)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSearch() {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllRecommended(_ sender: Any) {

		print(#function)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllRecent(_ sender: Any) {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView1() {

		collectionView1.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView2() {

		collectionView2.reloadData()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView3() {

		collectionView3.reloadData()
	}
}

// MARK:- UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if collectionView == collectionView1 { return categories.count }
		if collectionView == collectionView2 { return videos1.count }
		if collectionView == collectionView3 { return videos2.count }

		return 0
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if collectionView == collectionView1 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home1Cell1", for: indexPath) as! Home1Cell1
			cell.bindData(title: categories[indexPath.row])
			return cell
		}
		if collectionView == collectionView2 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home1Cell2", for: indexPath) as! Home1Cell2
			cell.bindData(index: indexPath.item, data: videos1[indexPath.row])
			return cell
		}
		if collectionView == collectionView3 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home1Cell2", for: indexPath) as! Home1Cell2
			cell.bindData(index: indexPath.item + 10, data: videos2[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK:- UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		if collectionView == collectionView1 {
		}
		if collectionView == collectionView2 {
		}
		if collectionView == collectionView3 {
		}
	}
}

// MARK:- UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let height = collectionView.frame.size.height
		let width = collectionView.frame.size.width

		if collectionView == collectionView1 {
			return CGSize(width: width/3, height: height)
		}
		if collectionView == collectionView2 {
			return CGSize(width: width/2.5, height: height)
		}
		if collectionView == collectionView3 {
			return CGSize(width: width/2.5, height: height)
		}
		return CGSize.zero
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if collectionView == collectionView1 {
			return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
		}
		if collectionView == collectionView2 {
			return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
		}
		if collectionView == collectionView3 {
			return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
		}
		return UIEdgeInsets.zero
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
