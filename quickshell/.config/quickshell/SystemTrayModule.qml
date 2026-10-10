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
            id: thing

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
                    } else if (event.button == Qt.MiddleButton) {
                        modelData.secondaryActivate()
                    } else if (event.button == Qt.RightButton) {
                        let position = thing.mapToItem(null, 0, 0)
                        modelData.display(toplevelBar, position.x, 30)
                    }
                }
            }
        }
    }
}
