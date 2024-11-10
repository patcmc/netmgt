module.exports = {
  // Content paths for PurgeCSS to scan
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{html.erb,rb}',
    './node_modules/flowbite/**/*.js'
  ],

  // Make sure to safelist these classes when using purge
  safelist: [
    'w-64',
    'w-1/2',
    'rounded-l-lg',
    'rounded-r-lg',
    'bg-gray-200',
    'grid-cols-4',
    'grid-cols-7',
    'h-6',
    'leading-6',
    'h-9',
    'leading-9',
    'shadow-lg'
  ],
  

  // Enable dark mode via class strategy
  darkMode: 'class',

  // Theme customizations
  theme: {
    extend: {
      colors: {
        50: '#f2f9f9',
        100: '#ddeff0',
        200: '#bfe0e2',
        300: '#92cace',
        400: '#5faab1',
        500: '#438e96',
        600: '#3b757f',
        700: '#356169',
        800: '#325158',
        900: '#2d464c',
        950: '#1a2c32',
        primary: '#438e96',
        secondary: '#5faab1',
        accent: '#92cace',
        neutral: '#2d464c',
        'base-100': '#ffffff',
        info: '#3b757f',
        success: '#5faab1',
        warning: '#bfe0e2',
        error: '#f2f9f9',
      },
    },
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
