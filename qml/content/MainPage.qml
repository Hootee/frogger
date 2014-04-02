import QtQuick 2.0
import QtQuick.Window 2.0
import Sailfish.Silica 1.0
import "gfx"
import "logic.js" as Logic

Page {
    id: mainPage
    width: Screen.width
    height: Screen.height
    property var gameState: Logic.newGameState(gameCanvas)

    signal moveFrodo(int dx, int dy)
    Component.onCompleted: {
        mainPage.moveFrodo.connect(gameCanvas.frodo.move);
    }

    Image {
        id: backgroundImage
        source: "gfx/background.png"
        anchors {
            top: mainPage.top
            bottom: controlsRow.top
        }
    }

    Image {
        id: splashImage
        source: "gfx/splash.png"
        anchors.fill: mainPage
        Image {
            id: startButtonImage
            source: "gfx/start.png"
            anchors {
                horizontalCenter: splashImage.horizontalCenter
                bottom: splashImage.bottom
                bottomMargin: 100
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    splashImage.visible = false;
                    gameCanvas.visible = true;
                    controlsRow.visible = true;
                    gameCanvas.startTimer();
                }
            }
        }
    }

    GameCanvas {
        id: gameCanvas
        visible: false
        anchors.fill: backgroundImage
    }

    Row {
        id: controlsRow
        visible: false
        height: 210
        anchors.bottom: parent.bottom
        Image {
            source: "gfx/arrow_left.png"
            height: parent.height
            MouseArea {
                anchors.fill: parent
                onClicked: mainPage.moveFrodo(-1, 0);
            }
        }
        Column {
            height: parent.height
            Image {
                source: "gfx/arrow_up.png"
                height: parent.height / 2
                MouseArea {
                    anchors.fill: parent
                    onClicked: mainPage.moveFrodo(0, -1);
                }
            }
            Image {
                source: "gfx/arrow_down.png"
                height: parent.height / 2
                MouseArea {
                    anchors.fill: parent
                    onClicked: mainPage.moveFrodo(0, 1);
                }
            }
        }
        Image {
            source: "gfx/arrow_right.png"
            height: parent.height
            MouseArea {
                anchors.fill: parent
                onClicked: mainPage.moveFrodo(1, 0);
            }
        }
    }

    focus: true
    Keys.onPressed: {
        switch (event.key) {
        case Qt.Key_Up:
            event.accepted = true;
            mainPage.moveFrodo(0, -1);
            break;
        case Qt.Key_Down:
            event.accepted = true;
            mainPage.moveFrodo(0, 1);
            break;
        case Qt.Key_Left:
            event.accepted = true;
            mainPage.moveFrodo(-1, 0);
            break;
        case Qt.Key_Right:
            event.accepted = true;
            mainPage.moveFrodo(1, 0);
            break;
        case Qt.Key_Q:
            event.accepted = true;
            Qt.quit();
            break;
        }
    }


}
