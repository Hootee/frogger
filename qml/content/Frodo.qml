import QtQuick 2.0
import "logic.js" as Logic

Item {
    height: Logic.row_height
    width: height
    z: 1001
    y: Logic.calculateComponentRow(row);
    property int row: 1
    property real external_speed: 0

    AnimatedSprite {
        id: frodo
        anchors.fill: parent
        source: "gfx/frog.png"
        frameCount: 3
        frameHeight: 50
        frameWidth: 50
        frameDuration:  200
        interpolate: false

        Behavior on rotation { RotationAnimation { duration: 200; direction: RotationAnimation.Shortest; } }
        Behavior on scale { NumberAnimation { duration: 1000; } }
    }

    AnimatedSprite {
        id: dead_frodo
        anchors.fill: frodo
        source: "gfx/dead_divers.png"
        visible: false
        running: false
        loops: 1
        frameCount: 5
        frameHeight: 100
        frameWidth: 100
        frameDuration:  500
        interpolate: true
        rotation: frodo.rotation
        onVisibleChanged: {
            start();
        }
    }

    Behavior on y { id: behavior_y; NumberAnimation { id: moving_y_anim; duration: 600; easing.type: Easing.InOutSine; } }
    Behavior on x { id: behavior_x; NumberAnimation { id: moving_x_anim; duration: 600; easing.type: Easing.OutCirc; } }

    function tick(speed) {
        external_speed = speed;
        behavior_x.enabled = false;
        x += speed;
        behavior_x.enabled = true;
    }

    function collision(comp_type, comp_speed) {
        switch (comp_type) {
        case 1: // car
            kill(comp_type);
            break;
        case 2: // log
            tick(comp_speed);
            break;
        case 3: // turtle
            tick(comp_speed);
            break;
        }
    }

    function kill(type) {
        switch (type){
        case 0: // drown
            frodo.scale = 0;
            break;
        case 1: // hit by a car
            dead_frodo.visible = true;
            frodo.visible = false;
            break;
        case 2: // out of play area
            break;
        }
        Logic.gameState.stopTimer();
    }

    function isFrodoMoving() {
        return moving_x_anim.running || moving_y_anim.running;
    }

    function move(dx, dy) {
        if(!isFrodoMoving()) {
            if (dy === -1) {
                frodo.state = "GO_UP"
                row -= dy;
                frodo.rotation = 0;
            }
            if (dy === 1) {
                frodo.state = "GO_DOWN"
                row -= dy;
                frodo.rotation = 180;
            }
            if (dx === -1) {
                frodo.state = "GO_LEFT"
                x -= width + (-6 * external_speed);
                frodo.rotation = 270;
            }
            if (dx === 1) {
                frodo.state = "GO_RIGHT"
                x += width - (-6 * external_speed);
                frodo.rotation = 90;
            }
        }
    }

    states: [
        State {
            name: "STATIONARY"
            when: { !moving_y_anim.running && !moving_x_anim.running }
            PropertyChanges { target: frodo; running: false; }
        },
        State {
            name: "GO_UP"
            PropertyChanges { target: frodo; running: true; }
        },
        State {
            name: "GO_DOWN"
            PropertyChanges { target: frodo; running: true; }
        },
        State {
            name: "GO_LEFT"
            PropertyChanges { target: frodo; running: true; }
        },
        State {
            name: "GO_RIGHT"
            PropertyChanges { target: frodo; running: true; }
        }
    ]
}

