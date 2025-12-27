pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    property list<Task> tasks

    enum Status {
        Done,
        Undone
    }

    component Task: QtObject {
        id: task
        property int status: TaskService.Status.Undone
        property string desc
        property date created: new Date()
        property date finished

        Component.onCompleted: root.tasks.push(task)

        function done() {
            task.finished = new Date();
            task.status = TaskService.Status.Done;
        }

        function undone() {
            task.finished = null;
            task.status = TaskService.Status.Undone;
        }
    }
}
