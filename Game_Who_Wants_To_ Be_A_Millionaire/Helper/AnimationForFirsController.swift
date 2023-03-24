

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
func loadingAnimateButton(buttonOne: UIImageView?, buttonTwo: UIImageView?, buttonThree: UIImageView?, buttonFour: UIImageView?) {
    UIImageView.animateKeyframes(withDuration: 1,
                                 delay: 3,
                                 options: []) {
        UIImageView.addKeyframe(withRelativeStartTime: 1,
                                relativeDuration: 0.5)  {
            buttonOne?.alpha = 0.1
            buttonTwo?.alpha = 0.1
            buttonThree?.alpha = 0.1
            buttonFour?.alpha = 0.1
        }
    } completion: { _ in
        buttonOne?.alpha = 1
        buttonTwo?.alpha = 1
        buttonThree?.alpha = 1
        buttonFour?.alpha = 1
    }
    
}
/// loadImageAnimation
func loadImageAnimation(image: UIImageView?, buttonOne: UIImageView?, buttonTwo: UIImageView?, buttonThree: UIImageView?, buttonFour: UIImageView?) {
    image?.alpha = 0.2
    loadingAnimateKeyFrame(exitAfter: 3, currentCount: 0, backgroundImage: image)
    loadingAnimateButton(buttonOne: buttonOne, buttonTwo: buttonTwo, buttonThree: buttonThree, buttonFour: buttonFour)
}
