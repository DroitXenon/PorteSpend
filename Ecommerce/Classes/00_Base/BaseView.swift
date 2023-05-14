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
class BaseView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var names: [String] = []

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "List of Views"

		navigationItem.largeTitleDisplayMode = .never
		navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

		tableView.tableFooterView = UIView()

		names.append("Login1View")
		names.append("Login2View")
		names.append("Login3View")
		names.append("Login4View")
		names.append("SignUp1View")
		names.append("SignUp2View")
		names.append("PhoneView")
		names.append("SecureCodeView")
		names.append("Location1View")
		names.append("Location2View")
		names.append("NotificationView")
		names.append("PasscodeView")
		names.append("PlanView")
		names.append("Walkthrough1View")
		names.append("Walkthrough2View")
		names.append("Walkthrough3View")
		names.append("Walkthrough4View")
		names.append("Walkthrough5View")
		names.append("Home1View")
		names.append("Home2View")
		names.append("Home3View")
		names.append("Categories1View")
		names.append("Categories2View")
		names.append("Categories3View")
		names.append("Categories4View")
		names.append("Items1View")
		names.append("Items2View")
		names.append("Items3View")
		names.append("Items4View")
		names.append("Items5View")
		names.append("Items6View")
		names.append("Items7View")
		names.append("Items8View")
		names.append("Items9View")
		names.append("Items10View")
		names.append("Search1View")
		names.append("Search2View")
		names.append("ImageZoom1View")
		names.append("ImageZoom2View")
		names.append("Item3DTouchView")
		names.append("ItemOptionsView")
		names.append("ItemDescriptionView")
		names.append("ChooseSizeView")
		names.append("ChooseColorView")
		names.append("SizeGuideView")
		names.append("HowToMeasureView")
		names.append("CompareItemsView")
		names.append("Item1View")
		names.append("Item2View")
		names.append("Item3View")
		names.append("Item4View")
		names.append("Item5View")
		names.append("Review1View")
		names.append("Review2View")
		names.append("AddReview1View")
		names.append("AddReview2View")
		names.append("Filters1View")
		names.append("FiltersCategoryView")
		names.append("SortByView")
		names.append("Filters2View")
		names.append("Filters3View")
		names.append("Cart1View")
		names.append("Cart2View")
		names.append("Cart3View")
		names.append("Cart4View")
		names.append("Cart5View")
		names.append("Payment1View")
		names.append("Payment2View")
		names.append("Payment3View")
		names.append("Payment4View")
		names.append("Shipping1View")
		names.append("Shipping2View")
		names.append("Shipping3View")
		names.append("OrderInfo1View")
		names.append("OrderInfo2View")
		names.append("SuccessOrderView")
		names.append("Wishlist1View")
		names.append("Wishlist2View")
		names.append("ContactsView")
		names.append("FeedbackView")
		names.append("AddGiftCardView")
		names.append("ScanCardView")
		names.append("SettingsView")
		names.append("AccountView")
		names.append("AccountDetailsView")
		names.append("AboutView")
	}
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDataSource {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return names.count
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
		if (cell == nil) { cell = UITableViewCell(style: .default, reuseIdentifier: "cell") }

		cell.textLabel?.text = "\(indexPath.row+1). " + names[indexPath.row]

		return cell
	}
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDelegate {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		switch names[indexPath.row] {

			case "Login1View":
				let login1View = Login1View()
				login1View.isModalInPresentation = true
				login1View.modalPresentationStyle = .fullScreen
				present(login1View, animated: true)

			case "Login2View":
				let login2View = Login2View()
				login2View.isModalInPresentation = true
				login2View.modalPresentationStyle = .fullScreen
				present(login2View, animated: true)

			case "Login3View":
				let login3View = Login3View()
				login3View.isModalInPresentation = true
				login3View.modalPresentationStyle = .fullScreen
				present(login3View, animated: true)

			case "Login4View":
				let login4View = Login4View()
				login4View.isModalInPresentation = true
				login4View.modalPresentationStyle = .fullScreen
				present(login4View, animated: true)

			case "SignUp1View":
				let signUp1View = SignUp1View()
				let navigation = NavigationController(rootViewController: signUp1View)
				navigation.isModalInPresentation = true
				navigation.navigationBar.isTranslucent = false
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "SignUp2View":
				let signUp2View = SignUp2View()
				let navigation = NavigationController(rootViewController: signUp2View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "PhoneView":
				let phoneView = PhoneView()
				navigationController?.pushViewController(phoneView, animated: true)

			case "SecureCodeView":
				let secureCodeView = SecureCodeView()
				navigationController?.pushViewController(secureCodeView, animated: true)

			case "Location1View":
				let location1View = Location1View()
				navigationController?.pushViewController(location1View, animated: true)

			case "Location2View":
				let location2View = Location2View()
				navigationController?.pushViewController(location2View, animated: true)

			case "NotificationView":
				let notificationView = NotificationView()
				let navigation = NavigationController(rootViewController: notificationView)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "PasscodeView":
				let passcodeView = PasscodeView()
				let navigation = NavigationController(rootViewController: passcodeView)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "PlanView":
				let planView = PlanView()
				navigationController?.pushViewController(planView, animated: true)

			case "Walkthrough1View":
				let walkthrough1View = Walkthrough1View()
				let navigation = NavigationController(rootViewController: walkthrough1View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough2View":
				let walkthrough2View = Walkthrough2View()
				let navigation = NavigationController(rootViewController: walkthrough2View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough3View":
				let walkthrough3View = Walkthrough3View()
				let navigation = NavigationController(rootViewController: walkthrough3View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough4View":
				let walkthrough4View = Walkthrough4View()
				walkthrough4View.isModalInPresentation = true
				walkthrough4View.modalPresentationStyle = .fullScreen
				present(walkthrough4View, animated: true)

			case "Walkthrough5View":
				let walkthrough5View = Walkthrough5View()
				walkthrough5View.isModalInPresentation = true
				walkthrough5View.modalPresentationStyle = .fullScreen
				present(walkthrough5View, animated: true)

			case "Home1View":
				let home1View = Home1View()
				home1View.modalPresentationStyle = .fullScreen
				present(home1View, animated: true)

			case "Home2View":
				let home2View = Home2View()
				let navController = NavigationController(rootViewController: home2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Home3View":
				let home3View = Home3View()
				let navController = NavigationController(rootViewController: home3View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Categories1View":
				let categories1View = Categories1View()
				navigationController?.pushViewController(categories1View, animated: true)

			case "Categories2View":
				let categories2View = Categories2View()
				navigationController?.pushViewController(categories2View, animated: true)

			case "Categories3View":
				let categories3View = Categories3View()
				navigationController?.pushViewController(categories3View, animated: true)

			case "Categories4View":
				let categories4View = Categories4View()
				navigationController?.pushViewController(categories4View, animated: true)

			case "Items1View":
				let items1View = Items1View()
				navigationController?.pushViewController(items1View, animated: true)

			case "Items2View":
				let items2View = Items2View()
				navigationController?.pushViewController(items2View, animated: true)

			case "Items3View":
				let items3View = Items3View()
				navigationController?.pushViewController(items3View, animated: true)

			case "Items4View":
				let items4View = Items4View()
				navigationController?.pushViewController(items4View, animated: true)

			case "Items5View":
				let items5View = Items5View()
				navigationController?.pushViewController(items5View, animated: true)

			case "Items6View":
				let items6View = Items6View()
				navigationController?.pushViewController(items6View, animated: true)

			case "Items7View":
				let items7View = Items7View()
				navigationController?.pushViewController(items7View, animated: true)

			case "Items8View":
				let items8View = Items8View()
				navigationController?.pushViewController(items8View, animated: true)

			case "Items9View":
				let items9View = Items9View()
				navigationController?.pushViewController(items9View, animated: true)

			case "Items10View":
				let items10View = Items10View()
				navigationController?.pushViewController(items10View, animated: true)

			case "Search1View":
				let search1View = Search1View()
				let navController = NavigationController(rootViewController: search1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Search2View":
				let search2View = Search2View()
				let navController = NavigationController(rootViewController: search2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "ImageZoom1View":
				let imageZoom1View = ImageZoom1View()
				let navController = NavigationController(rootViewController: imageZoom1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "ImageZoom2View":
				let imageZoom2View = ImageZoom2View()
				let navController = NavigationController(rootViewController: imageZoom2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Item3DTouchView":
				let item3DTouchView = Item3DTouchView()
				present(item3DTouchView, animated: true)

			case "ItemOptionsView":
				let itemOptionsView = ItemOptionsView()
				present(itemOptionsView, animated: true)

			case "ItemDescriptionView":
				let itemDescriptionView = ItemDescriptionView()
				navigationController?.pushViewController(itemDescriptionView, animated: true)

			case "ChooseSizeView":
				let chooseSizeView = ChooseSizeView()
				present(chooseSizeView, animated: true)

			case "ChooseColorView":
				let chooseColorView = ChooseColorView()
				present(chooseColorView, animated: true)

			case "SizeGuideView":
				let sizeGuideView = SizeGuideView()
				navigationController?.pushViewController(sizeGuideView, animated: true)

			case "HowToMeasureView":
				let howToMeasureView = HowToMeasureView()
				navigationController?.pushViewController(howToMeasureView, animated: true)

			case "CompareItemsView":
				let compareItemsView = CompareItemsView()
				navigationController?.pushViewController(compareItemsView, animated: true)

			case "Item1View":
				let item1View = Item1View()
				navigationController?.pushViewController(item1View, animated: true)

			case "Item2View":
				let item2View = Item2View()
				navigationController?.pushViewController(item2View, animated: true)

			case "Item3View":
				let item3View = Item3View()
				navigationController?.pushViewController(item3View, animated: true)

			case "Item4View":
				let item4View = Item4View()
				navigationController?.pushViewController(item4View, animated: true)

			case "Item5View":
				let item5View = Item5View()
				navigationController?.pushViewController(item5View, animated: true)

			case "Review1View":
				let review1View = Review1View()
				navigationController?.pushViewController(review1View, animated: true)

			case "Review2View":
				let review2View = Review2View()
				navigationController?.pushViewController(review2View, animated: true)

			case "AddReview1View":
				let addReview1View = AddReview1View()
				present(addReview1View, animated: true)

			case "AddReview2View":
				let addReview2View = AddReview2View()
				present(addReview2View, animated: true)

			case "Filters1View":
				let filters1View = Filters1View()
				navigationController?.pushViewController(filters1View, animated: true)

			case "FiltersCategoryView":
				let filtersCategoryView = FiltersCategoryView()
				navigationController?.pushViewController(filtersCategoryView, animated: true)

			case "SortByView":
				let sortByView = SortByView()
				present(sortByView, animated: true)

			case "Filters2View":
				let filters2View = Filters2View()
				navigationController?.pushViewController(filters2View, animated: true)

			case "Filters3View":
				let filters3View = Filters3View()
				navigationController?.pushViewController(filters3View, animated: true)

			case "Cart1View":
				let cart1View = Cart1View()
				let navController = NavigationController(rootViewController: cart1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Cart2View":
				let cart2View = Cart2View()
				let navController = NavigationController(rootViewController: cart2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Cart3View":
				let cart3View = Cart3View()
				let navController = NavigationController(rootViewController: cart3View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Cart4View":
				let cart4View = Cart4View()
				present(cart4View, animated: true)

			case "Cart5View":
				let cart5View = Cart5View()
				present(cart5View, animated: true)

			case "Payment1View":
				let payment1View = Payment1View()
				navigationController?.pushViewController(payment1View, animated: true)

			case "Payment2View":
				let payment2View = Payment2View()
				navigationController?.pushViewController(payment2View, animated: true)

			case "Payment3View":
				let payment3View = Payment3View()
				present(payment3View, animated: true)

			case "Payment4View":
				let payment4View = Payment4View()
				present(payment4View, animated: true)

			case "Shipping1View":
				let shipping1View = Shipping1View()
				navigationController?.pushViewController(shipping1View, animated: true)

			case "Shipping2View":
				let shipping2View = Shipping2View()
				present(shipping2View, animated: true)

			case "Shipping3View":
				let shipping3View = Shipping3View()
				navigationController?.pushViewController(shipping3View, animated: true)

			case "OrderInfo1View":
				let orderInfo1View = OrderInfo1View()
				navigationController?.pushViewController(orderInfo1View, animated: true)

			case "OrderInfo2View":
				let orderInfo2View = OrderInfo2View()
				navigationController?.pushViewController(orderInfo2View, animated: true)

			case "SuccessOrderView":
				let successOrderView = SuccessOrderView()
				present(successOrderView, animated: true)

			case "Wishlist1View":
				let wishlist1View = Wishlist1View()
				navigationController?.pushViewController(wishlist1View, animated: true)

			case "Wishlist2View":
				let wishlist2View = Wishlist2View()
				let navController = NavigationController(rootViewController: wishlist2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "ContactsView":
				let contactsView = ContactsView()
				navigationController?.pushViewController(contactsView, animated: true)

			case "FeedbackView":
				let feedbackView = FeedbackView()
				present(feedbackView, animated: true)

			case "AddGiftCardView":
				let addGiftCardView = AddGiftCardView()
				navigationController?.pushViewController(addGiftCardView, animated: true)

			case "ScanCardView":
				let scanCardView = ScanCardView()
				navigationController?.pushViewController(scanCardView, animated: true)

			case "SettingsView":
				let settingsView = SettingsView()
				navigationController?.pushViewController(settingsView, animated: true)

			case "AccountView":
				let accountView = AccountView()
				navigationController?.pushViewController(accountView, animated: true)

			case "AccountDetailsView":
				let accountDetailsView = AccountDetailsView()
				navigationController?.pushViewController(accountDetailsView, animated: true)

			case "AboutView":
				let aboutView = AboutView()
				navigationController?.pushViewController(aboutView, animated: true)

			default:
				break
		}
	}
}
