import Quickshell
import QtQuick

Text {
    id: clock
    font {
        family: "0xProto Nerd Font"
        pointSize: 9
    }

    color: CatppuccinMocha.text
    text: Qt.formatDateTime(systemClock.date, "hh:mm ap")

    SystemClock {
        id: systemClock
        precision: SystemClock.Minutes
    }
}
