<template>
  <div className="container">
    <h1>Menu</h1><br/>
    <router-link :to="{ name: 'Todo' }" exact>Todo</router-link><br/>
    <router-link :to="{ name: 'About' }">About</router-link><br/>
    <router-link :to="{ name: 'Hobbies' }">Hobbies</router-link><br/>
  </div>
</template>