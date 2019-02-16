# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
QT += multimedia dbus

TARGET = drum-machine

CONFIG += sailfishapp

PKGCONFIG += keepalive

SOURCES += src/drum-machine.cpp \
    qml/pages/beatblock.cpp

DISTFILES += qml/drum-machine.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    qml/pages/SavePage.qml \
    qml/pages/LoadPage.qml \
    qml/components/LocalStorage.qml \
    rpm/drum-machine.spec \
    rpm/drum-machine.yaml \
    drum-machine.desktop \
    qml/components/drumTimer.qml \
    qml/components/Beat.qml

RESOURCES += \
    resources.qrc

HEADERS += \
    qml/pages/beatblock.h


