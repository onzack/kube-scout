<template>
  <div id="app">
    <div class="wrapper">
      <div class="topMenu">
        <TopMenu />
      </div>
      <div class="leftMenu">
        <LeftMenu />
      </div>
      <div class="mainContent">
        <main>
          <router-view />
        </main>
      </div>
    </div>
  </div>
</template>
 
<script>
import TopMenu from './components/navigation/TopMenu.vue'
import LeftMenu from './components/navigation/LeftMenu.vue'

export default {
  components: {
    TopMenu,
    LeftMenu
  }
}
</script>

<style>
.wrapper {
  display: grid;
  grid-template-columns: repeat(8, 1fr);
  grid-gap: 5 px;
  grid-auto-rows: minmax(100px, auto);
}
.topMenu {
  grid-column: 1 / 9;
  grid-row: 1 ;
}
.leftMenu {
  grid-column: 1;
  grid-row: 2 / 9;
  background-image: linear-gradient(to bottom, #d0edf5, #e1e5f0 100%);
}
.mainContent {
  grid-column: 2 / 9;
  grid-row: 2 / 9;
}
</style>