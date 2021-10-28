<!-- Renders the flash message from the server -->
<template>
  <div class="components-flash--wrapper">
    <div ref="flashNotice" v-if="$page.props.flash.notice" class="components-flash notice">
      <font-awesome-icon class="alert-icon" icon="fa-solid fa-check" />
      <div>
        <h3>Great!</h3>
        <p>{{ $page.props.flash.notice }}</p>
      </div>
      <CloseButton @click="closeNotice" />
    </div>

    <div ref="flashAlert" v-if="$page.props.flash.alert" class="components-flash alert">
      <font-awesome-icon class="alert-icon" icon="fa-solid fa-xmark" />
      <div>
        <h3>Sorry!</h3>
        <p>{{ $page.props.flash.alert }}</p>
      </div>

      <CloseButton @click="closeAlert" />
    </div>
  </div>
</template>

<style lang="scss">
.components-flash--wrapper {
  position: fixed;
  top: 20px;
  right: 20px;

  display: flex;
  flex-direction: column;
}

.components-flash {
  position: relative;
  display: inline-flex;
  flex-direction: row;
  align-items: center;

  width: 320px;
  border-radius: 4px;
  padding: 15px 50px 15px 25px;
  text-align: left;

  &:not(:first-of-type) {
    margin-top: 15px;
  }

  border-left: 4px solid;

  @apply bg-white text-gray-700 shadow-md;

  h3 { @apply font-bold text-sm; }
  p { @apply text-xs; }
  .alert-icon { @apply mr-4 text-2xl; width: 24px; }

  transform: translate(0, -100%); opacity: 0;

  animation: displayFlashToast 0.2s forwards ease-out;
  @keyframes displayFlashToast {
    0% { transform: translate(0, -100%); opacity: 0; }
    100% { transform: translate(0, 0); opacity: 1; }
  }
  animation-delay: #{0.05 * 10}s;
  @for $i from 1 to 10 {
    &:nth-child(#{$i}n) {
      animation-delay: #{$i * 0.05}s;
    }
  }

  &.notice {
    @apply border-emerald-400;
    .alert-icon { @apply text-emerald-500; }
  }
  &.alert {
    @apply border-red-400;
    .alert-icon { @apply text-red-500; }
  }
}
</style>

<script>
import CloseButton from "./CloseButton.vue";

export default {
  components: { CloseButton },
  methods: {
    closeNotice() {
      this.$refs.flashNotice?.remove();
    },
    closeAlert() {
      this.$refs.flashAlert?.remove();
    }
  },

  mounted() {
    setTimeout(() => {
      this.closeNotice();
      this.closeAlert();
    }, 10_000);
  }
}
</script>