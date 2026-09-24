import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

RowLayout {
    id: workspaces

    spacing: 10

    Repeater {
        model: 10

        Rectangle {
            function determineColor(): string {
                let thisWorkspace = Hyprland.workspaces.values.find(w => w.id == modelData + 1)
                if (thisWorkspace == undefined) {
                    return CatppuccinMocha.crust
                }

                if (thisWorkspace.active) {
                    return CatppuccinMocha.sapphire
                }

                return CatppuccinMocha.surface1
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
