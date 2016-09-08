import UIKit
import PromiseKit
import TradeItIosEmsApi

class TradeItPortfolioViewController: UIViewController {
    let linkedBrokerManager = TradeItLauncher.linkedBrokerManager
    var ezLoadingActivityManager = EZLoadingActivityManager()
    var accountsTableViewManager = TradeItPortfolioAccountsTableViewManager()

    @IBOutlet weak var accountsTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.accountsTableViewManager.accountsTable = accountsTable

        self.ezLoadingActivityManager.show(text: "Authenticating", disableUI: true)

        self.linkedBrokerManager.authenticateAll(
            onSecurityQuestion: { (TradeItSecurityQuestionResult) -> String in
                // TODO: GET
                return "MY SPECIAL SECURITY ANSWER"
            },
            onFinishedAuthenticating: {
                self.accountsTableViewManager.updateAccounts(withAccounts: self.linkedBrokerManager.getAllAccounts())
                self.ezLoadingActivityManager.hide()
            }
        )
    }
}