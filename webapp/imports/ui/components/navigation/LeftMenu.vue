<template>
  <div className="container">
    <header>
      <h1>kube-scout Dashboard</h1>

        <router-link :to="{ name: 'Todo' }" exact>Todo</router-link>
        <router-link :to="{ name: 'About' }">About</router-link>
        <router-link :to="{ name: 'Hobbies' }">Hobbies</router-link>

      <blaze-template template="loginButtons" tag="span"></blaze-template>

    </header>
  </div>
</template>