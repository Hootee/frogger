import QtQuick 2.0
import "logic.js" as Logic

AnimatedSprite {
    id: movingComponent
    frameCount: 1
    frameHeight: 100
    frameWidth: 150
    frameDuration:  500
    interpolate: false
    property int startx
    property int endx
    property int speed
    property int row
    property int type
    scale: 0.8

    y: Logic.calculateComponentRow(row)

    function moveComponentAndFrodo(frodo_row, frodo_x) {
        var ret = false;
        if (frodo_row === row) {
            if ( x < frodo_x && x + width > frodo_x ) {
                    Logic.gameState.frodo.collision(type, speed);
                    ret = true;
            }
        }
        moveComponent();
        if (type === 3 && currentFrame === 4) return false;
        return ret;
    }

    function moveComponent() {
        x += speed;
        if (x > endx) {
            x = startx;
        } else if (x < startx) {
            x = endx;
        }
    }
}
