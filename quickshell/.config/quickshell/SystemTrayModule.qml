import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import Quickshell
import Quickshell.Services.SystemTray

RowLayout {
    Repeater {
        model: SystemTray.items

        Rectangle {
            implicitWidth: toplevelBar.height / 2
            implicitHeight: toplevelBar.height / 2
            color: "transparent"

            Image {
                source: modelData.icon
                anchors.fill: parent
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onClicked: event => {
                    if (event.button == Qt.LeftButton) {
                        modelData.activate()
                    } else if (event.button == Qt.RightButton) {

                    }
                }
            }
        }
    }
}
