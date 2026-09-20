import QtQuick
import Qt5Compat.GraphicalEffects
import Quickshell.Services.UPower

Item {
    Rectangle {
        id: batteryMask
        anchors.fill: parent
        radius: 5
        visible: false
    }

    Item {
        id: tankContent
        anchors.fill: parent
        // visible: false

        Rectangle {
            id: tankBackground
            anchors.fill: parent
            color: "#585b70"
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
            color: "#a6e3a1"
        }

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: batteryMask
        } 
    }
}
