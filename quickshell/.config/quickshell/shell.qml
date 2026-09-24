import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: toplevelBar

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 30
    color: "#00000000"

    WorkspacesHyprland {
        Layout.alignment: Qt.AlignVCenter
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 20
        }
    }

    RowLayout {
        anchors {
            right: parent.right
            rightMargin: 30
            verticalCenter: parent.verticalCenter
        }

        spacing: 30

        Volume {
            anchors {
                verticalCenter: parent.verticalCenter
            }
        }

        Battery {
            id: batteryModule

            width: 40
            height: 15

            anchors {
                verticalCenter: parent.verticalCenter
            }
        }
    }

    ClockModule {
        anchors {
            centerIn: parent
        }
    }
}
