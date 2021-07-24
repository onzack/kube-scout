<template>
  <div class="menu">
    <h1>Menu</h1><br/>
    <router-link :to="{ name: 'Todo' }" exact>Todo</router-link><br/>
    <router-link :to="{ name: 'About' }">About</router-link><br/>
    <router-link :to="{ name: 'Hobbies' }">Hobbies</router-link><br/>
  </div>
</template>

<style>
.menu {
  background-color: #B5B6BA;
  z-index: 2;
  padding: 0px 32px;
  display: grid;
  align-items: center;
  grid-template-columns: 200px auto;
  height: 100vh;
  width: 250px;
}

.logo {
  font-size: 32px;
  color: #C0C4CC;
}
</style>