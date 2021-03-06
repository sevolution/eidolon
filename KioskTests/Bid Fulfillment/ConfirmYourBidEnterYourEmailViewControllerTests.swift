import Quick
import Nimble
import Kiosk
import Nimble_Snapshots

func testConfirmYourBidEnterYourEmailViewController() -> ConfirmYourBidEnterYourEmailViewController {
    return ConfirmYourBidEnterYourEmailViewController.instantiateFromStoryboard(fulfillmentStoryboard).wrapInFulfillmentNav() as ConfirmYourBidEnterYourEmailViewController
}

class ConfirmYourBidEnterYourEmailViewControllerTests: QuickSpec {
    override func spec() {

        it("looks right by default") {
            let sut = testConfirmYourBidEnterYourEmailViewController()
            expect(sut).to(haveValidSnapshot())
        }

        it("passes the email to the nav's bid details object") {
            let sut = testConfirmYourBidEnterYourEmailViewController()
            let nav = sut.navigationController as FulfillmentNavigationController
            sut.loadViewProgrammatically()

            sut.emailTextField.text = "email"
            sut.emailTextField.sendActionsForControlEvents(.EditingChanged)

            expect(nav.bidDetails.newUser.email) == "email"
        }

        it("confirm button is disabled when no email") {
            let sut = testConfirmYourBidEnterYourEmailViewController()
            let nav = FulfillmentNavigationController(rootViewController:sut)
            nav.loadViewProgrammatically()
            sut.loadViewProgrammatically()

            expect(sut.confirmButton.enabled) == false
        }

        pending("enables the enter button when an email + password is entered") {
            let sut = testConfirmYourBidEnterYourEmailViewController()
            let nav = sut.navigationController as FulfillmentNavigationController
            sut.loadViewProgrammatically()

            sut.emailTextField.text = "email@address.com"
            sut.emailTextField.sendActionsForControlEvents(.EditingChanged)

            expect(sut.confirmButton.enabled) == true
        }

    }
}
