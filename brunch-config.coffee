exports.config =
  files:
    javascripts:
      joinTo: 'app.js'
    stylesheets:
      joinTo: 'app.css'
      order:
        before: [
          'colors'
        ]
  plugins:
    postcss:
      processors: [
        require('autoprefixer')(['last 8 versions']),
        require('postcss-cssnext')(),
        require('postcss-import')(),
        require('postcss-nested')(),
        require('postcss-nesting')(),
        #require('csswring')()
      ]
  npm:
    enabled: true
