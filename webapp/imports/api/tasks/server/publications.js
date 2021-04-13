import { Meteor } from 'meteor/meteor';
import { Tasks } from '/imports/db/tasks.js'

Meteor.publish('tasks', function tasksPublication() {
    return Tasks.find({
        $or: [
            { private: { $ne: true } },
            { owner: this.userId },
        ],
    });
});