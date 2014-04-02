import QtQuick 2.0
import "logic.js" as Logic
import "gfx"

Item {
    id: gameCanvas
    property var movingComponents
    property int canvasHeight: height
    property Frodo frodo: frodo

    Frodo {
        id: frodo
    }

    Timer {
        id:mainTimer
        interval: 100
        running: false
        repeat: true
        onTriggered: {
            Logic.tick();
        }
    }

    function startTimer() {
        mainTimer.start();
    }

    function stopTimer() {
        mainTimer.stop();
    }

}
