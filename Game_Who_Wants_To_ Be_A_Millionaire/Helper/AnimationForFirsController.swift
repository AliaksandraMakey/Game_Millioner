

import UIKit

/// loadingAnimateKeyFrame
func loadingAnimateKeyFrame(exitAfter: Int, currentCount: Int, backgroundImage: UIImageView?) {
    UIImageView.animateKeyframes(withDuration: 0.2,
                                 delay: 0,
                                 options: []) {
        UIImageView.addKeyframe(withRelativeStartTime: 0.05,
                                relativeDuration: 1)  {
            backgroundImage?.alpha = 0.1
        }
        UIImageView.addKeyframe(withRelativeStartTime: 0.1,
                                relativeDuration: 1)  {
            backgroundImage?.alpha = 0.2
        }
    } completion: { _ in
        if currentCount < exitAfter {
            loadingAnimateKeyFrame(exitAfter: exitAfter, currentCount: currentCount + 1, backgroundImage: backgroundImage)
        } else {
            backgroundImage?.alpha = 1
        }
    }
}
/// loadingAnimateButton
func loadingAnimateButton(buttonOne: UIImageView?, buttonTwo: UIImageView?) {
    UIImageView.animateKeyframes(withDuration: 0.2,
                                 delay: 3,
                                 options: []) {
        UIImageView.addKeyframe(withRelativeStartTime: 1,
                                relativeDuration: 0.1)  {
            buttonOne?.alpha = 0.5
            buttonTwo?.alpha = 0.5
        }
    } completion: { _ in
        buttonOne?.alpha = 1
        buttonTwo?.alpha = 1
    }
    
}
/// loadImageAnimation
func loadImageAnimation(image: UIImageView?, buttonOne: UIImageView?, buttonTwo: UIImageView?) {
    image?.alpha = 0.2
    loadingAnimateKeyFrame(exitAfter: 3, currentCount: 0, backgroundImage: image)
    loadingAnimateButton(buttonOne: buttonOne, buttonTwo: buttonTwo)
}
