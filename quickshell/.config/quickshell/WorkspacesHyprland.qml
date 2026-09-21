import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

RowLayout {
    id: workspaces

    spacing: 10

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
