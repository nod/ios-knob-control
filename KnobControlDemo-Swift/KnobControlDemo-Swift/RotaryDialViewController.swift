/*
Copyright (c) 2013-14, Jimmy Dee
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit

class RotaryDialViewController: UIViewController {

    @IBOutlet var knobHolder : UIView
    @IBOutlet var numberLabel : UILabel

    var knobControl : IOSKnobControl!
    var numberDialed = ""
                            
    override func viewDidLoad() {
        super.viewDidLoad()

        knobControl = IOSKnobControl(frame: knobHolder.bounds)
        knobControl.mode = .RotaryDial
        knobControl.gesture = .OneFingerRotation

        //*
        let normalColor = UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 0.7)
        let highlightedColor = UIColor(red: 0.0, green: 0.7, blue: 0.0, alpha: 0.7)
        let titleColor = UIColor(red: 0.0, green: 0.3, blue: 0.0, alpha: 1.0)

        knobControl.setFillColor(normalColor, forState: .Normal)
        knobControl.setFillColor(highlightedColor, forState: .Highlighted)
        knobControl.setTitleColor(titleColor, forState: .Normal)
        // */

        knobControl.addTarget(self, action: "dialed:", forControlEvents: .ValueChanged)
        knobHolder.addSubview(knobControl)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        numberDialed = ""
        numberLabel.text = "(number dialed)"
    }

    func dialed(sender: IOSKnobControl) {
        numberDialed = "\(numberDialed)\(sender.positionIndex)"
        numberLabel.text = numberDialed
    }

}
