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
		names.append("Home2View")
		names.append("Home3View")
		names.append("Top1View")
		names.append("Top2View")
		names.append("Categories1View")
		names.append("Categories2View")
		names.append("Categories3View")
		names.append("Categories4View")
		names.append("Categories5View")
		names.append("Posts1View")
		names.append("Posts2View")
		names.append("Posts3View")
		names.append("Posts4View")
		names.append("Posts5View")
		names.append("Posts6View")
		names.append("Posts7View")
		names.append("Posts8View")
		names.append("Posts9View")
		names.append("Posts10View")
		names.append("Posts11View")
		names.append("Post3DTouchView")
		names.append("PostOptionsView")
		names.append("Topics1View")
		names.append("Topics2View")
		names.append("Topics3View")
		names.append("Notifications1View")
		names.append("Notifications2View")
		names.append("Notifications3View")
		names.append("Search1View")
		names.append("Search2View")
		names.append("Bookmarks1View")
		names.append("Bookmarks2View")
		names.append("SettingsView")
		names.append("EditProfileView")
		names.append("Profile1View")
		names.append("Profile2View")
		names.append("Profile3View")
		names.append("Article1View")
		names.append("Article2View")
		names.append("Article3View")
		names.append("TextOptions1View")
		names.append("TextOptions2View")
		names.append("TextEditView")
		names.append("Comments1View")
		names.append("Comments2View")
		names.append("AddComment1View")
		names.append("AddComment2View")
		names.append("BookPageView")
		names.append("Books1View")
		names.append("Books2View")
		names.append("Book1View")
		names.append("Book2View")
		names.append("MyLibrary1View")
		names.append("MyLibrary2View")
		names.append("CollectionsView")
		names.append("Genres1View")
		names.append("Genres2View")
		names.append("FeaturedBooks1View")
		names.append("FeaturedBooks2View")
		names.append("AuthorsList1View")
		names.append("AuthorsList2View")
		names.append("Author1View")
		names.append("Author2View")
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

			case "Top1View":
				let top1View = Top1View()
				navigationController?.pushViewController(top1View, animated: true)

			case "Top2View":
				let top2View = Top2View()
				navigationController?.pushViewController(top2View, animated: true)

			case "Categories1View":
				let categories1View = Categories1View()
				let navController = NavigationController(rootViewController: categories1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Categories2View":
				let categories2View = Categories2View()
				let navController = NavigationController(rootViewController: categories2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Categories3View":
				let categories3View = Categories3View()
				navigationController?.pushViewController(categories3View, animated: true)

			case "Categories4View":
				let categories4View = Categories4View()
				let navController = NavigationController(rootViewController: categories4View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Categories5View":
				let categories5View = Categories5View()
				categories5View.modalPresentationStyle = .fullScreen
				present(categories5View, animated: true)

			case "Posts1View":
				let posts1View = Posts1View()
				navigationController?.pushViewController(posts1View, animated: true)

			case "Posts2View":
				let posts2View = Posts2View()
				navigationController?.pushViewController(posts2View, animated: true)

			case "Posts3View":
				let posts3View = Posts3View()
				navigationController?.pushViewController(posts3View, animated: true)

			case "Posts4View":
				let posts4View = Posts4View()
				navigationController?.pushViewController(posts4View, animated: true)

			case "Posts5View":
				let posts5View = Posts5View()
				navigationController?.pushViewController(posts5View, animated: true)

			case "Posts6View":
				let posts6View = Posts6View()
				navigationController?.pushViewController(posts6View, animated: true)

			case "Posts7View":
				let posts7View = Posts7View()
				navigationController?.pushViewController(posts7View, animated: true)

			case "Posts8View":
				let posts8View = Posts8View()
				posts8View.modalPresentationStyle = .fullScreen
				present(posts8View, animated: true)

			case "Posts9View":
				let posts9View = Posts9View()
				let navController = NavigationController(rootViewController: posts9View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Posts10View":
				let posts10View = Posts10View()
				navigationController?.pushViewController(posts10View, animated: true)

			case "Posts11View":
				let posts11View = Posts11View()
				navigationController?.pushViewController(posts11View, animated: true)

			case "Post3DTouchView":
				let post3DTouchView = Post3DTouchView()
				present(post3DTouchView, animated: true)

			case "PostOptionsView":
				let postOptionsView = PostOptionsView()
				present(postOptionsView, animated: true)

			case "Topics1View":
				let topics1View = Topics1View()
				let navController = NavigationController(rootViewController: topics1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Topics2View":
				let topics2View = Topics2View()
				navigationController?.pushViewController(topics2View, animated: true)

			case "Topics3View":
				let topics3View = Topics3View()
				navigationController?.pushViewController(topics3View, animated: true)

			case "Notifications1View":
				let notifications1View = Notifications1View()
				present(notifications1View, animated: true)

			case "Notifications2View":
				let notifications2View = Notifications2View()
				present(notifications2View, animated: true)

			case "Notifications3View":
				let notifications3View = Notifications3View()
				navigationController?.pushViewController(notifications3View, animated: true)

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

			case "Bookmarks1View":
				let bookmarks1View = Bookmarks1View()
				bookmarks1View.modalPresentationStyle = .fullScreen
				present(bookmarks1View, animated: true)

			case "Bookmarks2View":
				let bookmarks2View = Bookmarks2View()
				bookmarks2View.modalPresentationStyle = .fullScreen
				present(bookmarks2View, animated: true)

			case "SettingsView":
				let settingsView = SettingsView()
				let navController = NavigationController(rootViewController: settingsView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "EditProfileView":
				let editProfileView = EditProfileView()
				let navController = NavigationController(rootViewController: editProfileView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Profile1View":
				let profile1View = Profile1View()
				navigationController?.pushViewController(profile1View, animated: true)

			case "Profile2View":
				let profile2View = Profile2View()
				navigationController?.pushViewController(profile2View, animated: true)

			case "Profile3View":
				let profile3View = Profile3View()
				navigationController?.pushViewController(profile3View, animated: true)

			case "Article1View":
				let article1View = Article1View()
				navigationController?.pushViewController(article1View, animated: true)

			case "Article2View":
				let article2View = Article2View()
				navigationController?.pushViewController(article2View, animated: true)

			case "Article3View":
				let article3View = Article3View()
				navigationController?.pushViewController(article3View, animated: true)

			case "TextOptions1View":
				let textOptions1View = TextOptions1View()
				navigationController?.pushViewController(textOptions1View, animated: true)

			case "TextOptions2View":
				let textOptions2View = TextOptions2View()
				navigationController?.pushViewController(textOptions2View, animated: true)

			case "TextEditView":
				let textEditView = TextEditView()
				let navController = NavigationController(rootViewController: textEditView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Comments1View":
				let comments1View = Comments1View()
				navigationController?.pushViewController(comments1View, animated: true)

			case "Comments2View":
				let comments2View = Comments2View()
				navigationController?.pushViewController(comments2View, animated: true)

			case "AddComment1View":
				let addComment1View = AddComment1View()
				present(addComment1View, animated: true)

			case "AddComment2View":
				let addComment2View = AddComment2View()
				present(addComment2View, animated: true)

			case "BookPageView":
				let bookPageView = BookPageView()
				let navController = NavigationController(rootViewController: bookPageView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Books1View":
				let books1View = Books1View()
				navigationController?.pushViewController(books1View, animated: true)

			case "Books2View":
				let books2View = Books2View()
				navigationController?.pushViewController(books2View, animated: true)

			case "Book1View":
				let book1View = Book1View()
				navigationController?.pushViewController(book1View, animated: true)

			case "Book2View":
				let book2View = Book2View()
				navigationController?.pushViewController(book2View, animated: true)

			case "MyLibrary1View":
				let myLibrary1View = MyLibrary1View()
				let navController = NavigationController(rootViewController: myLibrary1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "MyLibrary2View":
				let myLibrary2View = MyLibrary2View()
				let navController = NavigationController(rootViewController: myLibrary2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "CollectionsView":
				let collectionsView = CollectionsView()
				present(collectionsView, animated: true)

			case "Genres1View":
				let genres1View = Genres1View()
				navigationController?.pushViewController(genres1View, animated: true)

			case "Genres2View":
				let genres2View = Genres2View()
				navigationController?.pushViewController(genres2View, animated: true)

			case "FeaturedBooks1View":
				let featuredBooks1View = FeaturedBooks1View()
				featuredBooks1View.modalPresentationStyle = .fullScreen
				present(featuredBooks1View, animated: true)

			case "FeaturedBooks2View":
				let featuredBooks2View = FeaturedBooks2View()
				let navController = NavigationController(rootViewController: featuredBooks2View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "AuthorsList1View":
				let authorsList1View = AuthorsList1View()
				navigationController?.pushViewController(authorsList1View, animated: true)

			case "AuthorsList2View":
				let authorsList2View = AuthorsList2View()
				navigationController?.pushViewController(authorsList2View, animated: true)

			case "Author1View":
				let author1View = Author1View()
				navigationController?.pushViewController(author1View, animated: true)

			case "Author2View":
				let author2View = Author2View()
				navigationController?.pushViewController(author2View, animated: true)

			default:
				break
		}
	}
}
