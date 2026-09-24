import QtQuick

import Quickshell
import Quickshell.Services.Pipewire

Text {
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    property real volume: ( Pipewire.defaultAudioSink.audio.volume)

    function chooseIcon(): string {
        if (volume <= 0.1) {
            return ''
        } else if (0.1 < volume && volume <= 0.33) {
            return ''
        } else if (0.33 < volume && volume <= 0.66) {
            return ''
        } else if (0.66 < volume && volume <= 1.0) {
            return ''
        }     
    }

    font.family: "0xProto Nerd Font"
    color: CatppuccinMocha.text
    text: `${chooseIcon()}  ${Math.round(volume * 100)}%`
}
