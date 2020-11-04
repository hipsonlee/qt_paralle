import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import TcpMoveToThread 1.0


ApplicationWindow {
    visible: true
    height: 300
    width: 400
//    Button{
//        id: redbutton
//        anchors.left: parent.left
//        anchors.top: parent.top
//        text: "加载红色"
//        onClicked: {
//            recloader.sourceComponent=redRec;
//        }
//    }
//    Button{
//        id: bluebutton
//        anchors.right: parent.right
//        anchors.top: parent.top
//        text: "加载蓝色"
//        onClicked: {
//            recloader.sourceComponent=blueRec;
//        }
//    }

    Text {
        id: message
        text: qsTr("text")
        font.pixelSize: 25
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.top: recloader.bottom
    }


    Connections{
        target: tcp
        onDataChanged:{
            message.text=tcp.m_data;  //此处连接了TcpMoveToThread类的信号，一旦数据改变，就改变message的内容
        }
    }

    TcpMoveToThread{
        id: tcp

    }


//    Loader{
//        id: recloader
//        anchors.centerIn: parent
//        height: 100
//        width: 100
//    }
//    Component{
//        id: redRec
//        Rectangle{
//            color: "red"
//        }
//    }
//    Component{
//        id:blueRec
//        Rectangle{
//            color: "blue"
//        }
//    }


}
