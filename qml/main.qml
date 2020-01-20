import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

import Qt.labs.platform 1.1 as Platform

import App 1.0
import '.' as Ui

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
//    property alias canvasFrame: canvasFrame

/*
    Loader {
        id: canvasLoader
        //anchors.fill: parent
        //sourceComponent: Ui.Canvas
        //source: "canvas.qml"
    }
*/

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: fileOpen.open()
            }
        }
        Menu {
            title: qsTr("&Test")
            MenuItem {
                text: qsTr("&Image Set")
                onTriggered: imageItem.openImage("nothing")
            }
            MenuItem {
                text: qsTr("&Signal")
                onTriggered: workspace.test()
            }
        }
    }

    header: Text {
        text: "Toolbar"
    }

    Workspace {
        id: worspaceToo
    }

    ImageItem {
        id: imageItem
        width: 1024
        height: 1024
        Text {
            text: "ImageItem"
        }
        Component.onCompleted: {
            print("ImageItem is complete.")
        }
    }

    /*
    Ui.CanvasFrame {
        id: canvasFrame
    }
    */

    Platform.FileDialog {
        id: fileOpen
        nameFilters: ["All Files (*)"]
        onAccepted: {
            print(imagePane)
            imagePane.openImage(fileOpen.file)
            print("File is: " + fileOpen.files)
        }
    }

    Component.onCompleted: {
        print(Canvas)
        print(typeof(Canvas))
        for (var p in Canvas) {
            print(p + Canvas[p])
        }
        /*
        console.log(Qml)
        console.log(JSON.stringify(Qml))
        console.log(JSON.stringify(Qml.canvasContainer))
        */
    }
}
