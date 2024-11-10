module.exports = {
  // Content paths for PurgeCSS to scan
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './node_modules/flowbite/**/*.js'
  ],

  // Enable dark mode via class strategy
  darkMode: 'class',

  // Theme customizations
  theme: {
    extend: {},
  },

  // Plugins to enhance Tailwind CSS
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/container-queries'),
    require('flowbite/plugin')({
      charts: true,
      forms: true,
      tooltips: true
    }),
    // ...additional plugins...
  ],
}
