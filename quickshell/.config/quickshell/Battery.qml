import QtQuick
import Qt5Compat.GraphicalEffects
import Quickshell.Services.UPower

Item {
    Rectangle {
        id: batteryMask
        anchors.fill: parent
        radius: width / 2
        visible: false
    }

    Item {
        id: tankContent
        anchors.fill: parent
        // visible: false

        Rectangle {
            id: tankBackground
            anchors.fill: parent
            color: CatppuccinMocha.surface2
            radius: 5

        } 

        function getBattery(): UPowerDevice {
            for (var device of UPower.devices.values) {
                if (device.isLaptopBattery) {
                    return device
                }
            }
        }

        Rectangle {
            id: filledContent
            width: parent.width * parent.getBattery().percentage
            height: parent.height
            anchors.left: parent.left
            color: CatppuccinMocha.green
        }

        Text {
            color: CatppuccinMocha.crust
            font {
                family: "0xProto Nerd Font"
                bold: true
                pointSize: 9
            }

            anchors.centerIn: parent

            text: 100 * parent.getBattery().percentage
        }

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: batteryMask
        } 
    }
}
