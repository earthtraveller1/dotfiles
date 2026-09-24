import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import Quickshell.Services.UPower
import Quickshell

Item {
    id: batteryPill

    Rectangle {
        id: batteryMask
        anchors.fill: parent
        radius: width / 2
        visible: false
    }

    function getBattery(): UPowerDevice {
        for (var device of UPower.devices.values) {
            if (device.isLaptopBattery) {
                return device
            }
        }
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

        Rectangle {
            id: filledContent
            width: parent.width * batteryPill.getBattery().percentage
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

            text: 100 * batteryPill.getBattery().percentage
        }

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: batteryMask
        } 
    }

    Button {
        anchors.fill: parent
        onClicked: {
            batteryDetails.visible = !batteryDetails.visible
        }
        background: Rectangle {
            color: "#00000000"
        }
    }

    PopupWindow {
        id: batteryDetails
        color: "transparent"
        visible: false

        implicitWidth: 160
        implicitHeight: 40

        anchor {
            window: toplevelBar
            rect {
                x: parentWindow.width - batteryDetails.width - 20
                y: parentWindow.height
            }
        }

        Rectangle {
            anchors.fill: parent
            id: batteryDetailsInterior
            // anchors.fill: parent
            radius: 10
            color: CatppuccinMocha.green

            Text {
                function formatTime(timeNumber: real): string {
                    let hours = Math.floor(timeNumber / 3600)
                    let minutes = Math.floor((timeNumber % 3600) / 60)
                    let seconds = Math.floor(timeNumber % 60)

                    return `${hours}:${minutes}:${seconds}`
                }

                text: `${formatTime(batteryPill.getBattery().timeToEmpty)} until empty`
                font.family: "0xProto Nerd Font"
                anchors.centerIn: parent
            }
        }
    }
}
