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
class SelectRoomCell1: UITableViewCell {

	@IBOutlet var labelRoomName: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelFacility1: UILabel!
	@IBOutlet var labelFacility2: UILabel!
	@IBOutlet var labelFacility3: UILabel!
	@IBOutlet var labelFacility4: UILabel!
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var labelRoomCount: UILabel!
	@IBOutlet var buttonMinus: UIButton!
	@IBOutlet var buttonPlus: UIButton!
	@IBOutlet var labelAmount: UILabel!
	@IBOutlet var buttonBook: UIButton!

	private var imageCount = 0
	private var currentIndex = 1

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(UINib(nibName: "SelectRoomCell2", bundle: nil), forCellWithReuseIdentifier: "SelectRoomCell2")

		buttonMinus.addTarget(self, action: #selector(actionMinus), for: .touchUpInside)
		buttonPlus.addTarget(self, action: #selector(actionPlus), for: .touchUpInside)
		buttonBook.addTarget(self, action: #selector(actionBook), for: .touchUpInside)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, room: [String: String]) {

		guard let name = room["name"] else { return }
		guard let description = room["description"] else { return }
		guard let facility1 = room["facility1"] else { return }
		guard let facility2 = room["facility2"] else { return }
		guard let facility3 = room["facility3"] else { return }
		guard let facility4 = room["facility4"] else { return }
		guard let amount = room["amount"] else { return }
		guard let images = room["images"] else { return }

		currentIndex = index
		labelRoomName.text = name
		labelDescription.text = description
		labelFacility1.text = facility1
		labelFacility2.text = facility2
		labelFacility3.text = facility3
		labelFacility4.text = facility4
		labelAmount.text = amount
		imageCount = Int(images) ?? 6

		refreshCollectionView()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMinus() {

		if let roomcount = Int(labelRoomCount.text ?? "0") {
			if roomcount > 0 {
				labelRoomCount.text = "\(roomcount - 1)"
			}
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionPlus() {

		if let roomcount = Int(labelRoomCount.text ?? "0") {
			if roomcount < 9 {
				labelRoomCount.text = "\(roomcount + 1)"
			}
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionBook() {

		print(#function)
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}
}

// MARK:- UICollectionViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SelectRoomCell1: UICollectionViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return imageCount
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectRoomCell2", for: indexPath) as! SelectRoomCell2
		cell.bindData(index: indexPath.item + (currentIndex * 2))
		return cell
	}
}

// MARK:- UICollectionViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SelectRoomCell1: UICollectionViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK:- UICollectionViewDelegateFlowLayout
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension SelectRoomCell1: UICollectionViewDelegateFlowLayout {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let height = collectionView.frame.size.height

		return CGSize(width: height * 1.4, height: height - 20)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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
