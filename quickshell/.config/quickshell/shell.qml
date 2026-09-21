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
    color: "#be1e1e2e"

    RowLayout {
        id: workspaces
        anchors.verticalCenter: parent.verticalCenter
        x: 20
        spacing: 15

        Layout.alignment: Qt.AlignVCenter

        Repeater {
            model: Hyprland.workspaces.values

            Rectangle {
                function determineColor(): string {
                    if (modelData.focused) {
                        return "#74c7ec"
                    } else {
                        return "#cdd6f4"
                    }
                }

                Behavior on color {
                    ColorAnimation {
                        duration: 100 // Animation duration in milliseconds (0.5 seconds)
                    }
                }

                width: 10
                height: 10
                radius: 30
                color: determineColor()
            }
        }
    }

    Battery {
        width: 50
        height: 15

        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 40
        }
    }

    ClockModule {
        anchors {
            centerIn: parent
        }
    }
}
