//
//  LottieTestViewController.swift
//  lottie4test
//
//  Created by Nitish Gadangi on 06/01/23.
//

import UIKit
import SnapKit
import Lottie

//typealias LottieAnimationView = AnimationView
//typealias LottieAnimation = Lottie.Animation

class LottieTestViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Lottie 4.0 Test"
        label.textColor = .blue
        label.isUserInteractionEnabled = true
        return label
    }()

    let backgroundBehaviour: LottieBackgroundBehavior = .forceFinish

    private let lottieView: LottieAnimationView = {
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named("home_icon")
        print(" small \(animationView.currentRenderingEngine)")
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()

    private let lottieView2: LottieAnimationView = {
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named("l_biggest")
        print(" medium \(animationView.currentRenderingEngine)")
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()

    private let lottieView3: LottieAnimationView = {
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named("bb_machine_cta")
        animationView.textProvider = DictionaryTextProvider(["Copy comes here": "TEST TEXT"])
        print(" big \(animationView.currentRenderingEngine)")
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()

    private let lottieView4: LottieAnimationView = {
        let imgProvider = DictionaryImageProvider(dict: ["image0": UIImage(named: "test_img")!])
        let animationView = LottieAnimationView(name: "bnpl_onboarding_intro", imageProvider: imgProvider)
        print(" biggest \(animationView.currentRenderingEngine)")
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()

    private let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "test_img")
        imgView.contentMode = .scaleAspectFit
        imgView.isHidden = true
        return imgView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        setUpUI()
    }

    private func setUpUI() {
        view.addSubview(label)
        view.addSubview(lottieView)
        view.addSubview(lottieView2)
        view.addSubview(lottieView3)
        view.addSubview(lottieView4)
        view.addSubview(imageView)

        lottieView.backgroundBehavior = backgroundBehaviour
        lottieView2.backgroundBehavior = backgroundBehaviour
        lottieView3.backgroundBehavior = backgroundBehaviour
        lottieView4.backgroundBehavior = backgroundBehaviour

        label.snp.makeConstraints { make in
            make.center.equalTo(self.view)
        }

        lottieView.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(100)
            make.leading.equalTo(self.view)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }

        lottieView2.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(100)
            make.trailing.equalTo(self.view)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }

        lottieView3.snp.makeConstraints { make in
            make.bottom.equalTo(self.view).offset(-100)
            make.leading.equalTo(self.view)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }

        lottieView4.snp.makeConstraints { make in
            make.bottom.equalTo(self.view).offset(-100)
            make.trailing.equalTo(self.view)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }

        imageView.snp.makeConstraints { make in
            make.bottom.equalTo(self.view).offset(-310)
            make.trailing.equalTo(self.view)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }

        let labelTap = UITapGestureRecognizer(target: self, action: #selector(play))
        label.addGestureRecognizer(labelTap)
        play()

    }

    @objc func play() {
        lottieView.play(fromFrame: DPTabBarAnimationConfigModel.lottieEndFrame, toFrame: DPTabBarAnimationConfigModel.lottieStartFrame) { isCompleted in
            print("new Lottie 1 \(isCompleted)")
        }
        lottieView2.play { isCompleted in
            print("new Lottie 2 \(isCompleted)")
        }
        lottieView3.play { isCompleted in
            print("new Lottie 3 \(isCompleted)")
        }
        lottieView4.play { isCompleted in
            print("new Lottie 4 \(isCompleted)")
        }
    }

}

struct DPTabBarAnimationConfigModel {
    static let lottieEndFrame: CGFloat = 14
    static let lottieStartFrame: CGFloat = 0
    static let tabItemHideDuration: CGFloat = 0.10
}
