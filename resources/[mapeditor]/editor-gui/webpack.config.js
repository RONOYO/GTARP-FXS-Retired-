module.exports = {
  mode: 'none',
  devtool: 'source-map',
  entry: './src/index.js',
  output: {
    filename: './editor-gui.js'
  },
  module: {
    rules: [{
      test: /\.js$/,
      exclude: /node_modules/,
      use: 'babel-loader'
    }]
  }
};
