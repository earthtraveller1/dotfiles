import QtQuick

import Quickshell
import Quickshell.Services.Pipewire

Text {
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    font.family: "0xProto Nerd Font"
    color: CatppuccinMocha.text
    text: `${Pipewire.defaultAudioSink.nickname}: ${Math.round(Pipewire.defaultAudioSink.audio.volume * 100)}%`
}
