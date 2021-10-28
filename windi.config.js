import { defineConfig } from 'windicss/helpers';

export default defineConfig({
    extract: {
        include: [
            'app/views/**/*.{html,erb}',
            'app/javascript/**/*.{html,vue,jsx,tsx,svelte}'
        ]
    }
})