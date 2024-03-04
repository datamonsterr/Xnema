/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./view/**/*.templ"],
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")],
};
