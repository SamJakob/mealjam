/* Rails */
import * as ActiveStorage from "@rails/activestorage";
import "../channels";

/* Vue and Inertia */
import Vue from 'vue';
import { createInertiaApp, Head, Link } from '@inertiajs/inertia-vue';
import { InertiaProgress } from "@inertiajs/progress";
import * as Routes from '../routes.js';

/* Styles */
import 'virtual:windi.css';
// import 'virtual:windi-devtools';
import '~/stylesheets/application.scss';

ActiveStorage.start();

const pages = import.meta.glob('../Pages/**/*.vue');
Vue.prototype.$routes = Routes;
Vue.component('InertiaHead', Head);
Vue.component('InertiaLink', Link);
InertiaProgress.init();

createInertiaApp({
    id: 'app',
    title: title => title ? `${title} – MealJam` : `MealJam`,
    resolve: name => {
        const importPage = pages[`../Pages/${name}.vue`];
        if (!importPage) throw new Error(`Unknown page name ${name}. Is it located under Pages/ with a .vue extension?`);
        return importPage().then(module => module.default);
    },
    setup({ el, App, props }) {
        new Vue({
            render: h => h(App, props)
        }).$mount(el);
    },
}).then(() => {
    console.log("⚡️ Ready!");
});
