import QtQuick
import QtQuick.Controls.Basic

// BUG: If the transition duration is close
// to the closing delay of the popout, it will
// trigger the onExited event and close the popout
// even if the mouse is still over it.
StackView {
    id: control

    property int duration: 200
    property Easing easing: Easing.OutCubic

    popExit: popExit
    popEnter: popEnter
    pushEnter: pushEnter
    pushExit: pushExit

    Transition {
        id: pushExit
        XAnimator {
            from: 0
            to: -control.width
            duration: control.duration
            easing.type: control.easing
        }
    }

    Transition {
        id: pushEnter
        XAnimator {
            from: control.width
            to: 0
            duration: control.duration
            easing.type: control.easing
        }
    }

    Transition {
        id: popEnter
        XAnimator {
            from: -control.width
            to: 0
            duration: control.duration
            easing.type: control.easing
        }
    }

    Transition {
        id: popExit
        XAnimator {
            from: 0
            to: +control.width
            duration: control.duration
            easing.type: control.easing
        }
    }
}
