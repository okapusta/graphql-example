const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  resolve: {
    modules: ['./node_modules']
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './frontend/index.html'
    }),
  ],
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['env', 'react']
          }
        }
      }
    ]
  },
  devServer: {
    disableHostCheck: true,
    historyApiFallback: true
  },
  mode: 'development',
  entry: './frontend/index.js',
  output: {
    publicPath: '/'
  }
};
