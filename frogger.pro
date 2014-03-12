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
    frogger.desktop

