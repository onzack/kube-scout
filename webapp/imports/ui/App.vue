<template>
  <div id="app">
    <div class="header">
      <Header />
    </div>
    <div class="row">
      <div class="leftColumn">
        <Menu />
      </div>
      <div class="mainColumn">
        <main>
          <router-view />
        </main>
      </div>
    </div>
  </div>
</template>
 
<script>
import Header from './components/navigation/Header.vue'
import Menu from './components/navigation/Menu.vue'

export default {
  components: {
    Header,
    Menu
  }
}
</script>

<style>
.header {
  background-color: #1D273B;
  z-index: 2;
  padding: 0px 32px;

  display: grid;
  align-items: center;
  grid-template-columns: 200px auto;

  height: 88px;

}

.row {
  display: flex;
}

.column {
  flex: 50%;
}

.mainColumn {
  margin: 32px;

  display: grid;
  grid-template-columns: 1fr 1fr;
  column-gap: 24px;
}
</style>