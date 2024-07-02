import daisyui from "daisyui";
module.exports = {
  content: ["./view/**/*.{html,templ}"],
  theme: {
    extend: {},
  },
  plugins: [daisyui],
  daisyui: {
    themes: [
      {
        xnema: {
          "primary": "#E54B4B",
          "secondary": "#4B9BE5",
          "neutral": "#3d4451",
          "base-100": "#000000",
          "base-200": "#111111",
          "base-300": "#222222",
          "ghost": "#86afff",
          "success": "#86efac",
          "warning": "#ff9900",
          "error": "#ff5724",
        },
      },
    ],
  },
};
