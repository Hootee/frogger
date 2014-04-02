.pragma library

var gameState

var movingComponent = Qt.createComponent("MovingComponent.qml");

var canvasWidth = 540;
var canvasHeight= 750;

var row = {not_play: -1, safe: 0, road: 1, water: 2, goal: 3};
var rows = [
            row["not_play"],
            row["safe"],
            row["road"],
            row["road"],
            row["road"],
            row["road"],
            row["road"],
            row["safe"],
            row["water"],
            row["water"],
            row["water"],
            row["water"],
            row["water"],
            row["goal"],
            row["not_play"]
        ];
var row_height = Math.floor(canvasHeight / rows.length);

function calculateComponentRow(row) {
    return canvasHeight - row_height * (row + 1);
}

//                   source, frameHeight, frameWidth, frameCount, frameDuration, running,     height,            width, type, speed, row,              startx, initialx, endx
var components = [
            ["gfx/car2rev.png",       50,         70,          1,           500,   false, row_height, row_height * 1.5,    1,    -5,   2,   -row_height * 1.5,        0,  540],
            ["gfx/car2rev.png",       50,         70,          1,           500,   false, row_height, row_height * 1.5,    1,    -5,   2,   -row_height * 1.5,      300,  540],
            ["gfx/tractor.png",       50,         70,          1,           500,   false, row_height, row_height * 1.5,    1,     2,   3,   -row_height * 1.5,        0,  540],
            ["gfx/tractor.png",       50,         70,          1,           500,   false, row_height, row_height * 1.5,    1,     2,   3,   -row_height * 1.5,      200,  540],
            ["gfx/car3rev.png",       50,        100,          1,           500,   false, row_height, row_height * 1.5,    1,    -4,   4,   -row_height * 1.5,        0,  540],
            ["gfx/car3rev.png",       50,        100,          1,           500,   false, row_height, row_height * 1.5,    1,    -4,   4,   -row_height * 1.5,      250,  540],
            ["gfx/car1.png",          50,         70,          1,           500,   false, row_height, row_height * 1.5,    1,     5,   5,   -row_height * 1.5,        0,  540],
            ["gfx/car1.png",          50,         70,          1,           500,   false, row_height, row_height * 1.5,    1,     5,   5,   -row_height * 1.5,      350,  540],
            ["gfx/truck1rev.png",     50,        100,          1,           500,   false, row_height, row_height * 1.5,    1,    -3,   6,   -row_height * 1.5,        0,  540],
            ["gfx/truck1rev.png",     50,        100,          1,           500,   false, row_height, row_height * 1.5,    1,    -3,   6,   -row_height * 1.5,      400,  540],
            ["gfx/3turtlesrevanim.png", 50,      180,          3,           500,    true, row_height,   row_height * 3,    3,    -3,   8,     -row_height * 3,        0,  540],
            ["gfx/3turtlesrevanim.png", 50,      180,          6,           500,    true, row_height,   row_height * 3,    3,    -3,   8,     -row_height * 3,      200,  540],
            ["gfx/3turtlesrevanim.png", 50,      180,          3,           500,    true, row_height,   row_height * 3,    3,    -3,   8,     -row_height * 3,      400,  540],
            ["gfx/log3.png",          50,        150,          1,           500,   false, row_height,   row_height * 3,    2,     4,   9,     -row_height * 3,        0,  540],
            ["gfx/log3.png",          50,        150,          1,           500,   false, row_height,   row_height * 3,    2,     4,   9,     -row_height * 3,      400,  540],
            ["gfx/log5.png",          50,        250,          1,           500,   false, row_height,   row_height * 5,    2,     2,  10,     -row_height * 5,        0,  540],
            ["gfx/log5.png",          50,        250,          1,           500,   false, row_height,   row_height * 5,    2,     2,  10,     -row_height * 5,      400,  540],
            ["gfx/2turtlesrev.png",   50,        120,          1,           500,   false, row_height,   row_height * 2,    3,    -4,  11,     -row_height * 2,        0,  540],
            ["gfx/2turtlesrev.png",   50,        120,          1,           500,   false, row_height,   row_height * 2,    3,    -4,  11,     -row_height * 2,      200,  540],
            ["gfx/2turtlesrev.png",   50,        120,          1,           500,   false, row_height,   row_height * 2,    3,    -4,  11,     -row_height * 2,      400,  540],
            ["gfx/log4.png",          50,        200,          1,           500,   false, row_height,   row_height * 4,    2,     5,  12,     -row_height * 4,        0,  540],
            ["gfx/log4.png",          50,        200,          1,           500,   false, row_height,   row_height * 4,    2,     5,  12,     -row_height * 4,      400,  540]
        ];

function newGameState(canvas) {
    gameState = canvas;
    gameState.movingComponents = new Array;
    createMovingComponents();
    return gameState;
}


function createMovingComponents() {
    for (var i = 0; i < components.length; i++) {
        newMovingComponent(components[i]);
    }
}

function newMovingComponent(comp) {
    var ret = movingComponent.createObject(
                gameState, {
                    "source" : comp[0],
                    "frameHeight" : comp[1],
                    "frameWidth" : comp[2],
                    "frameCount" : comp[3],
                    "frameDuration" : comp[4],
                    "running" : comp[5],
                    "height" : comp[6],
                    "width" : comp[7],
                    "type" : comp[8],
                    "speed" : comp[9],
                    "row" : comp[10],
                    "startx" : comp[11],
                    "x" : comp[12],
                    "endx" : comp[13]
                });
    gameState.movingComponents.push(ret);
    return ret;
}

function tick() {
    var component;
    var frodo_moved_or_killed = false;
    var frodo_row = gameState.frodo.row;
    var frodo_x = Math.floor(gameState.frodo.x + gameState.frodo.width / 2);
    gameState.frodo.tick(0); // reset external speed

    if (frodo_x < 0 || frodo_x > canvasWidth) {
        gameState.frodo.kill(2); // out of play area
    }

    for (var i = 0; i < gameState.movingComponents.length; i++) {
        component = gameState.movingComponents[i];
        if (gameState.frodo.isFrodoMoving()) {
            component.moveComponent();
        } else {
            if (component.moveComponentAndFrodo(frodo_row, frodo_x)) {
                frodo_moved_or_killed = true;
            }
        }
    }

    if (!frodo_moved_or_killed && !gameState.frodo.isFrodoMoving()) {
        switch (rows[frodo_row]) {
        case row["not_play"]: // not play area
            break;
        case row["safe"]: // safe
            break;
        case row["road"]: // road
            break;
        case row["water"]: // water
            gameState.frodo.kill(0); // 0 drown
            break;
        case row["goal"]:
            break;
        }
    }
}
