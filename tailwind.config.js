module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/components/**/*.html.erb',
    './app/components/**/*.rb'
  ],
  plugins: [
    require('@tailwindcss/forms'),
  ],
  theme: {
    extend: {
      colors: {
        'x-axis': '#00338D',
        'y-axis': '#FB4F14',
      },
    },
  },
}
