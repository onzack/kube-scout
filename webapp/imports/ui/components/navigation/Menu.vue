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

  height: auto;
  width: 300px;

}

.logo {
  font-size: 32px;
  color: #C0C4CC;
}

.headermenue {
  justify-self: end;
}

.headermenue > div {
  height: 24px;
  width: 24px;
  font-size: 24px;
}

.userMenu {
  padding: 8px;

  display: grid;
  grid-template-columns: 1fr;
  justify-items: stretch;
  color: #C0C4CC;

  float: right;
  width: 300px;
}
</style>