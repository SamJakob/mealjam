/* Rails */
import * as ActiveStorage from "@rails/activestorage";
import "../channels";

/* Vue and Inertia */
import Vue from 'vue';
import { createInertiaApp, Head, Link } from '@inertiajs/inertia-vue';
import { InertiaProgress } from "@inertiajs/progress";
import Routes from "~/Api";

/* Styles */
import 'virtual:windi.css';
// import 'virtual:windi-devtools';
import '~/stylesheets/application.scss';

/* FontAwesome (Icons */
import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { loadIcons } from "./icons";

loadIcons(library);

ActiveStorage.start();

const pages = import.meta.glob('../Pages/**/*.vue');
Vue.prototype.$routes = Routes;
window.$routes = Routes;
Vue.prototype.$route = (of, params) => {
    if (of?.hasOwnProperty('path'))
        return of.path(params);

    throw new Error(`Unknown page.`);
};
Vue.component('InertiaHead', Head);
Vue.component('InertiaLink', Link);
Vue.component('FontAwesomeIcon', FontAwesomeIcon);
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
