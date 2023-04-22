//
//  LandingViewController.swift
//  Landing
//
//  Created by Christian Calixto on 21/4/23.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!

    var onStart: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    @IBAction func onStartTapped(_ sender: Any) {
        
        onStart?()
    }

}

private extension LandingViewController {

    func setUI() {

        logoImageView.image = UIImage(named: "Logo", in: Bundle(for: LandingViewController.self), with: nil)
        startButton.setImage(UIImage(named: "ic-start", in: Bundle(for: LandingViewController.self), with: nil), for: .normal)
//        startButton.setTitle("", for: .normal)
    }
}
