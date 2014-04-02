# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = frogger

CONFIG += sailfishapp

SOURCES += src/frogger.cpp

OTHER_FILES += qml/frogger.qml \
    qml/cover/CoverPage.qml \
    rpm/frogger.spec \
    rpm/frogger.yaml \
    frogger.desktop \
    qml/content/MainPage.qml \
    qml/content/logic.js \
    qml/content/gfx/background.png \
    qml/content/GameCanvas.qml \
    qml/content/gfx/arrow_right.png \
    qml/content/gfx/arrow_left.png \
    qml/content/gfx/arrow_down.png \
    qml/content/gfx/arrow_up.png \
    qml/content/Frodo.qml \
    qml/content/gfx/dead_divers.png \
    qml/content/MovingComponent.qml \
    qml/content/gfx/frog.png \
    qml/content/gfx/car1.png \
    qml/content/gfx/car2.png \
    qml/content/gfx/truck1.png \
    qml/content/gfx/tractor.png \
    qml/content/gfx/car3.png \
    qml/content/gfx/truck1rev.png \
    qml/content/gfx/tractorrev.png \
    qml/content/gfx/car3rev.png \
    qml/content/gfx/car2rev.png \
    qml/content/gfx/car1rev.png \
    qml/content/gfx/3turtlesrev.png \
    qml/content/gfx/2turtlesrev.png \
    qml/content/gfx/3turtlesrevanim.png \
    qml/content/gfx/log3.png \
    qml/content/gfx/log4.png \
    qml/content/gfx/log5.png \
    qml/content/gfx/splash.png \
    qml/content/gfx/start.png

