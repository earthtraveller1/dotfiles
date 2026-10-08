import Quickshell
import Quickshell.Networking
import QtQuick

Rectangle {
    id: networkPill
    radius: width / 2;
    width: 150
    height: 20
    state: (function() {
        if (Networking.connectivity == Networking.Full) {
            return "CONNECTED"
        } else {
            return "DISCONNECTED"
        }
    })()

    Text {
        id: networkText
        anchors {
            centerIn: parent
        }

        font.family: "0xProto Nerd Font"
        color: CatppuccinMocha.base
    }

    states: [
        State {
            name: "CONNECTED"
            PropertyChanges { networkText.text: "Connected :D" }
            PropertyChanges { networkPill.color: CatppuccinMocha.blue }
        },
        State {
            name: "DISCONNECTED"
            PropertyChanges { networkText.text: "No Internet :c" }
            PropertyChanges { networkPill.color: CatppuccinMocha.flamingo }
        },
    ]
}
