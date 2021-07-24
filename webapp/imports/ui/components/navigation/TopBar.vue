<template>
  <div class="header">
    <div class="logo">
      kube-scout
    </div>
    <div class="headermenue">
      <blaze-template template="loginButtons" tag="span" class=userMenu></blaze-template>
    </div>
  </div>
</template>

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
  float: right;
}
/*
.userMenu {
  padding: 8px;
  display: grid;
  grid-template-columns: 1fr;
  justify-items: stretch;
  color: #C0C4CC;
  float: right;
  width: 300px;
}
*/
</style>