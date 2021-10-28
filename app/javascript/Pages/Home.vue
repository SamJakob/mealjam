<template>
  <div>
    <h2>Hello, world!</h2>
    <p><inertia-link :href="$routes.contact()">Contact</inertia-link></p>
  </div>
</template>

<script>
import DefaultLayout from '../Layouts/Default.vue';

export default {
  layout: DefaultLayout
}
</script>