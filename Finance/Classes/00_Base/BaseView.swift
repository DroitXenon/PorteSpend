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
		names.append("MonthlyReportView")
		names.append("Cards1View")
		names.append("Transactions1View")
		names.append("NotificationsView")
		names.append("LimitsView")
		names.append("Settings1View")
		names.append("Transactions2View")
		names.append("AccountsView")
		names.append("WireTransferView")
		names.append("ReportView")
		names.append("CoinsView")
		names.append("ExchangeView")
		names.append("MarketView")
		names.append("CoinView")
		names.append("Cards2View")
		names.append("AddCardView")
		names.append("Settings2View")
		names.append("Home2View")
		names.append("SendMoneyView")
		names.append("SuccessPaymentView")
		names.append("RateAppView")
		names.append("PhonePaymentView")
		names.append("ListView")
		names.append("MapView")
		names.append("CurrencyView")
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
				let navController = NavigationController(rootViewController: home1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "MonthlyReportView":
				let monthlyReportView = MonthlyReportView()
				navigationController?.pushViewController(monthlyReportView, animated: true)

			case "Cards1View":
				let cards1View = Cards1View()
				navigationController?.pushViewController(cards1View, animated: true)

			case "Transactions1View":
				let transactions1View = Transactions1View()
				let navController = NavigationController(rootViewController: transactions1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "NotificationsView":
				let notificationsView = NotificationsView()
				navigationController?.pushViewController(notificationsView, animated: true)

			case "LimitsView":
				let limitsView = LimitsView()
				navigationController?.pushViewController(limitsView, animated: true)

			case "Settings1View":
				let settings1View = Settings1View()
				let navController = NavigationController(rootViewController: settings1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Transactions2View":
				let transactions2View = Transactions2View()
				let navController = NavigationController(rootViewController: transactions2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "AccountsView":
				let accountsView = AccountsView()
				let navController = NavigationController(rootViewController: accountsView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "WireTransferView":
				let wireTransferView = WireTransferView()
				navigationController?.pushViewController(wireTransferView, animated: true)

			case "ReportView":
				let reportView = ReportView()
				let navController = NavigationController(rootViewController: reportView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "CoinsView":
				let coinsView = CoinsView()
				let navController = NavigationController(rootViewController: coinsView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "ExchangeView":
				let exchangeView = ExchangeView()
				navigationController?.pushViewController(exchangeView, animated: true)

			case "MarketView":
				let marketView = MarketView()
				navigationController?.pushViewController(marketView, animated: true)

			case "CoinView":
				let coinView = CoinView()
				navigationController?.pushViewController(coinView, animated: true)

			case "Cards2View":
				let cards2View = Cards2View()
				navigationController?.pushViewController(cards2View, animated: true)

			case "AddCardView":
				let addCardView = AddCardView()
				let navController = NavigationController(rootViewController: addCardView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Settings2View":
				let settings2View = Settings2View()
				navigationController?.pushViewController(settings2View, animated: true)

			case "Home2View":
				let home2View = Home2View()
				let navController = NavigationController(rootViewController: home2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "SendMoneyView":
				let sendMoneyView = SendMoneyView()
				navigationController?.pushViewController(sendMoneyView, animated: true)

			case "SuccessPaymentView":
				let successPaymentView = SuccessPaymentView()
				let navController = NavigationController(rootViewController: successPaymentView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "RateAppView":
				let rateAppView = RateAppView()
				let navController = NavigationController(rootViewController: rateAppView)
				present(navController, animated: true)

			case "PhonePaymentView":
				let phonePaymentView = PhonePaymentView()
				navigationController?.pushViewController(phonePaymentView, animated: true)

			case "ListView":
				let listView = ListView()
				navigationController?.pushViewController(listView, animated: true)

			case "MapView":
				let mapView = MapView()
				navigationController?.pushViewController(mapView, animated: true)

			case "CurrencyView":
				let currencyView = CurrencyView()
				let navController = NavigationController(rootViewController: currencyView)
				present(navController, animated: true)

			default:
				break
		}
	}
}
