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
class AuthorsList2View: UITableViewController {

	private var sections: [String] = []
	private var sectionIndex = ["#", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
	private var authors: [[[String: String]]] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Authors"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justifyleft"), style: .plain, target: self, action: #selector(actionShort(_:)))

		tableView.tintColor = AppColor.Theme
		tableView.register(UINib(nibName: "AuthorsList2Cell", bundle: Bundle.main), forCellReuseIdentifier: "AuthorsList2Cell")

		loadData()
	}

	// MARK: - Data methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		authors.removeAll()

		var dataDic1: [[String: String]] = []
		var dataDic2: [[String: String]] = []
		var dataDic3: [[String: String]] = []
		var dataDic4: [[String: String]] = []
		var dataDic5: [[String: String]] = []
		var dataDic6: [[String: String]] = []
		var dataDic7: [[String: String]] = []
		var dataDic8: [[String: String]] = []
		var dataDic9: [[String: String]] = []
		var dataDic10: [[String: String]] = []

		var dic1: [String: String] = [:]
		dic1["name"] = "Agatha Christie"
		dic1["books"] = "85"
		dataDic1.append(dic1)

		var dic2: [String: String] = [:]
		dic2["name"] = "Akira Toriyama"
		dic2["books"] = "66"
		dataDic1.append(dic2)

		var dic3: [String: String] = [:]
		dic3["name"] = "Alexander Pushkin"
		dic3["books"] = "17"
		dataDic1.append(dic3)

		var dic4: [String: String] = [:]
		dic4["name"] = "Corín Tellado"
		dic4["books"] = "32"
		dataDic2.append(dic4)

		var dic5: [String: String] = [:]
		dic5["name"] = "Catherine Cookson"
		dic5["books"] = "60"
		dataDic2.append(dic5)

		var dic6: [String: String] = [:]
		dic6["name"] = "Clive Cussler"
		dic6["books"] = "335"
		dataDic2.append(dic6)

		var dic7: [String: String] = [:]
		dic7["name"] = "Dan Brown"
		dic7["books"] = "14"
		dataDic3.append(dic7)

		var dic8: [String: String] = [:]
		dic8["name"] = "Danielle Steel"
		dic8["books"] = "27"
		dataDic3.append(dic8)

		var dic9: [String: String] = [:]
		dic9["name"] = "David Baldacci"
		dic9["books"] = "11"
		dataDic3.append(dic9)

		var dic10: [String: String] = [:]
		dic10["name"] = "Enid Blyton"
		dic10["books"] = "100"
		dataDic4.append(dic10)

		var dic11: [String: String] = [:]
		dic11["name"] = "Erskine Caldwell"
		dic11["books"] = "723"
		dataDic4.append(dic11)

		var dic12: [String: String] = [:]
		dic12["name"] = "Evan Hunter"
		dic12["books"] = "23"
		dataDic4.append(dic12)

		var dic13: [String: String] = [:]
		dic13["name"] = "Georges Simenon"
		dic13["books"] = "38"
		dataDic5.append(dic13)

		var dic14: [String: String] = [:]
		dic14["name"] = "Gilbert Patten"
		dic14["books"] = "103"
		dataDic5.append(dic14)

		var dic15: [String: String] = [:]
		dic15["name"] = "Gérard de Villiers"
		dic15["books"] = "37"
		dataDic5.append(dic15)

		var dic16: [String: String] = [:]
		dic16["name"] = "Harold Robbins"
		dic16["books"] = "4000"
		dataDic6.append(dic16)

		var dic17: [String: String] = [:]
		dic17["name"] = "Hermann Hesse"
		dic17["books"] = "7"
		dataDic6.append(dic17)

		var dic18: [String: String] = [:]
		dic18["name"] = "Horatio Alger"
		dic18["books"] = "179"
		dataDic6.append(dic18)

		var dic19: [String: String] = [:]
		dic19["name"] = "Jackie Collins"
		dic19["books"] = "25"
		dataDic7.append(dic19)

		var dic20: [String: String] = [:]
		dic20["name"] = "James A. Michener"
		dic20["books"] = "91"
		dataDic7.append(dic20)

		var dic21: [String: String] = [:]
		dic21["name"] = "James Patterson"
		dic21["books"] = "33"
		dataDic7.append(dic21)

		var dic22: [String: String] = [:]
		dic22["name"] = "Kyotaro Nishimura"
		dic22["books"] = "400"
		dataDic8.append(dic22)

		var dic23: [String: String] = [:]
		dic23["name"] = "Ken Follett"
		dic23["books"] = "30"
		dataDic8.append(dic23)

		var dic24: [String: String] = [:]
		dic24["name"] = "Karl May"
		dic24["books"] = "80"
		dataDic8.append(dic24)

		var dic25: [String: String] = [:]
		dic25["name"] = "Leo Tolstoy"
		dic25["books"] = "48"
		dataDic9.append(dic25)

		var dic26: [String: String] = [:]
		dic26["name"] = "Lewis Carroll"
		dic26["books"] = "5"
		dataDic9.append(dic26)

		var dic27: [String: String] = [:]
		dic27["name"] = "Louis L'Amour"
		dic27["books"] = "101"
		dataDic9.append(dic27)

		var dic28: [String: String] = [:]
		dic28["name"] = "Nicholas Sparks"
		dic28["books"] = "22"
		dataDic10.append(dic28)

		var dic29: [String: String] = [:]
		dic29["name"] = "Nora Roberts"
		dic29["books"] = "200"
		dataDic10.append(dic29)

		var dic30: [String: String] = [:]
		dic30["name"] = "Norman Bridwell"
		dic30["books"] = "80"
		dataDic10.append(dic30)

		authors.append(dataDic1)
		authors.append(dataDic2)
		authors.append(dataDic3)
		authors.append(dataDic4)
		authors.append(dataDic5)
		authors.append(dataDic6)
		authors.append(dataDic7)
		authors.append(dataDic8)
		authors.append(dataDic9)
		authors.append(dataDic10)

		for value in authors {
			guard let name = value.first?["name"] else{ return }
			if let firstLetter = name.first {
				sections.append(String(firstLetter).capitalized)
			}
		}

		refreshTableView()
	}

	// MARK: - Refresh methods
	//-------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//-------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShort(_ sender: UIBarButtonItem) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AuthorsList2View {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func numberOfSections(in tableView: UITableView) -> Int {

		return authors.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return authors[section].count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorsList2Cell", for: indexPath) as! AuthorsList2Cell
		cell.bindData(index: indexPath.item + (indexPath.section * 3), data: authors[indexPath.section][indexPath.row])
		return cell
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func sectionIndexTitles(for tableView: UITableView) -> [String]? {

		return sectionIndex
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {

		if let index = sections.firstIndex(of: title) {
			return index
		}
		return -1
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension AuthorsList2View {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 45
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 30
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if let firstLetter = authors[section].first?["name"]?.first {
			return String(firstLetter).capitalized
		}
		return nil
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if let header = view as? UITableViewHeaderFooterView {
			let viewY = header.frame.size.height - 0.5
			let view = UIView(frame: CGRect(x: 0, y: viewY, width: header.frame.size.width, height: 1))
			view.backgroundColor = .tertiarySystemFill
			view.tag = 1001
			header.contentView.subviews.forEach { (view) in
				if (view.tag == 1001) {
					view.removeFromSuperview()
				}
			}
			header.contentView.addSubview(view)
			header.textLabel?.font = UIFont.systemFont(ofSize: 12)
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
