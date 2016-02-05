module.exports = config:
  files:
    javascripts: joinTo: 'app.js'
    stylesheets: joinTo: 'app.css'
  plugins:
    static:
      processors: [
        require('html-brunch-static') {
          handlebars:
            enableProcessor: true
        }
      ]
