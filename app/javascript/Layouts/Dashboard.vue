<template>
  <div>

    <Flash />

    <inertia-head>
      <title>My MealJam</title>
    </inertia-head>

    <main>
      <slot />
    </main>

  </div>
</template>
<script>
import Flash from "~/Components/Flash.vue";

export default {
  components: {Flash}
}
</script>