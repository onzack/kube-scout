<template>
  <div className="container">
    <header>
      <h2>Todo List ({{ incompleteCount }})</h2>
       
      <label className="hide-completed">
        <input
          type="checkbox"
          readOnly
          checked="hideCompleted"
          v-model="hideCompleted"
          @click="toggleHideCompleted"
        />
        Hide Completed Tasks
      </label>

      <template v-if="currentUser">
        <form className="new-task" @submit.prevent="handleSubmit">
          <input
            type="text"
            placeholder="Type to add new tasks"
            v-model="newTask"
          />
        </form>
      </template>
    </header>
    <ul>
      <Task
        v-for="task in tasks"
        v-bind:key="task._id"
        v-bind:task="task"
        v-bind:showPrivateButton="showPrivateButton(task)"
      />
    </ul>
  </div>
</template>
 
<script>
import { Meteor } from "meteor/meteor";
import Task from "../components/todo/Task.vue";
import { Tasks } from "/imports/db/tasks.js";
 
export default {
  components: {
    Task
  },
  data() {
    return {
      newTask: "",
      hideCompleted: false
    };
  },
  methods: {
    handleSubmit(event) {
      Meteor.call("tasks.insert", this.newTask);
 
      // Clear form
      this.newTask = "";
    },
    toggleHideCompleted() {
      this.hideCompleted = !this.hideCompleted;
    },
    showPrivateButton(task) {
      const currentUserId = this.currentUser?._id;
      return task.owner === currentUserId;
    }
  },
  meteor: {
    $subscribe: {
      // Subscribes to the 'threads' publication with no parameters
      tasks: []
    },
    tasks() {
      let filteredTasks = Tasks.find({}, { sort: { createdAt: -1 } }).fetch();
      if (this.hideCompleted) {
        filteredTasks = filteredTasks.filter(task => !task.checked);
      }
      return filteredTasks;
    },
    incompleteCount() {
      return Tasks.find({ checked: { $ne: true } }).count();
        },
    currentUser() {
      return Meteor.user();
    }
  }
};
</script>