import { defineConfig } from 'vite';

import { createVuePlugin as VuePlugin } from 'vite-plugin-vue2';
import RubyPlugin, { projectRoot } from 'vite-plugin-ruby';
import WindiCSS from 'vite-plugin-windicss';
import ReloadOnChange from 'vite-plugin-full-reload';

export default defineConfig({
  plugins: [
    ReloadOnChange([ 'windi.config.js', 'config/routes.rb', 'app/views/**/*' ], { delay: 200 }),
    RubyPlugin(),
    VuePlugin(),
    WindiCSS({ root: __dirname })
  ],
});
