import UIKit
import Parse


private let reuseIdentifier = "Cell"

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user, error ) in
            if user != nil {
                print("you're logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            
        }
    }
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackground { (success, error ) in
            if success {
                print("Yay, Created a user!")
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print(error?.localizedDescription as Any)
                if error?._code == 202 {
                    print("User name is taken")
                }
                
            };
        }
    }

}
