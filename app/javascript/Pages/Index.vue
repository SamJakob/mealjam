<template>
  <div>
    <h2>Hello, world!</h2>
    <p>You are unauthenticated and the marketing pages have not yet been completed.</p>
    <br>
    <p><inertia-link :href="$route($routes.pages.contact)">Contact</inertia-link></p>

    <hr class="my-8">

    <p><inertia-link :href="$route($routes.authenticationLogin.index)">Login</inertia-link></p>
    <p><inertia-link :href="$route($routes.dashboardPages.index)">Dashboard</inertia-link></p>
  </div>
</template>

<script>
import DefaultLayout from '~/Layouts/Default.vue';

export default {
  layout: DefaultLayout
}
</script>