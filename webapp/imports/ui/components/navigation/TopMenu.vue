<template>
  <div className="container">
    <header>
      <h1>kube-scout Dashboard</h1>
      <blaze-template template="loginButtons" tag="span" class=userMenu></blaze-template>

    </header>
  </div>
</template>

<style>
.userMenu {
  float: right;
  width: 300px;
}
</style>