const bg = '#29283b';
const fg = '#b3b0d6';
const black = '#000';
const red = '#ef6487';
const green = '#cfa5f3';	//Actually different shade of purple for file paths
const yellow = '#ffdca8';	//Better yellow
const blue = '#dedeed';		//More of a dark purple for directories
const magenta = '#aa7ff0';
const cyan = '#f58aa5';		//Actually salmon
const white = '#ffffff';

exports.decorateConfig = (config) => {
  return Object.assign({}, config, {
    cursorColor: fg,
    foregroundColor: fg,
    backgroundColor: bg,
    borderColor: fg,
    colors: {
      black,
      red,
      green,
      yellow,
      blue,
      magenta,
      cyan,
      white,
      lightBlack: black,
      //lightRed: red,
      lightGreen: green,
      lightYellow: yellow,
      lightBlue: blue,
      lightMagenta: magenta,
      lightCyan: cyan,
      lightWhite: white
    },
    css: `
      ${config.css || ''}

      .hyper_main {
        border-width: 6px;
        //box-shadow: 5px 5px;
      }
    `
  });
}
