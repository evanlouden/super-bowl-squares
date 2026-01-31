module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/components/**/*.html.erb',
    './app/components/**/*.rb'
  ],
  plugins: [require('@tailwindcss/forms')],
  theme: {
    extend: {
      colors: {
        'y-axis': '#C60C30',
        'x-axis': '#69BE28',
      },
    },
  },
};
