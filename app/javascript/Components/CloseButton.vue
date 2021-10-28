<template>
  <span class="components-close-button" @click="$emit('click')">
    <font-awesome-icon icon="fa-solid fa-xmark" />
  </span>
</template>

<style lang="scss">
.components-close-button {
  position: absolute;
  top: 12.5px;
  right: 20px;

  @apply text-gray-400 font-light;

  cursor: pointer;

  -webkit-user-select: none !important;
  user-select: none !important;
}
</style>