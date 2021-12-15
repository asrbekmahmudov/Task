
import UIKit

class ViewController: UIViewController {

    @IBOutlet var animationView: UIView!
    @IBOutlet var animateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews() {
        animationView.backgroundColor = .gray
        animationView.layer.cornerRadius = 10
        animationView.frame.size.width = 70
        animationView.frame.size.height = 70
        animationView.frame.origin.x = UIScreen.width/2 - 35
        animationView.frame.origin.y = UIScreen.height - UIScreen.height/4
        
        animateButton.setTitle("Animates", for: .normal)
        animateButton.backgroundColor = UIColor.systemGray5
        animateButton.layer.cornerRadius = 10
        animateButton.frame.size.width = UIScreen.width - 50
        animateButton.frame.size.height = 70
    }
    
    @IBAction func animeteView(_ sender: Any) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: { [self] in
            animationView.frame.size.width -= 30
            animationView.frame.size.height -= 30
            animationView.layer.cornerRadius = 5
        
            animationView.frame.origin.x -= 50
            animationView.frame.origin.y -= 150
        }, completion: { _ in
                UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: { [self] in
                    animationView.frame.origin.x += 170
                }, completion: { _ in
                        UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: { [self] in
                            animationView.frame.origin.x -= 120
                            animationView.frame.origin.y += 150
                            animationView.frame.size.width += 30
                            animationView.frame.size.height += 30
                            animationView.layer.cornerRadius = 10
                        }, completion: nil)
                })
        })
    }

}

extension UIScreen {
    static var width = UIScreen.main.bounds.width
    static var height = UIScreen.main.bounds.height
}

