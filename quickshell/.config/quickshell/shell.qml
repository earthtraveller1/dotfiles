import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 30
    color: "#aa1e1e2e"

    WorkspacesHyprland {
        Layout.alignment: Qt.AlignVCenter
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 20
        }
    }

    Battery {
        width: 50
        height: 15

        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 20
        }
    }

    ClockModule {
        anchors {
            centerIn: parent
        }
    }
}
