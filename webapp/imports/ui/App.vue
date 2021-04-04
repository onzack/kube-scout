<template>
  <div id="app">
    <app-nav />
  
    <main>
      <router-view />
    </main>

  </div>
</template>
 
<script>
import AppNav from './components/navigation/Navigation.vue'

export default {
  components: {
    AppNav,
  }
}
</script>