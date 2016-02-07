exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: {
        "js/app.js": /^(web\/static\/js\/app)/,
        "js/admin.js": /^(web\/static\/js\/admin)/
      }
    },
    stylesheets: {
      joinTo: {
        "css/app.css": /^(web\/static\/css\/app)/,
        "css/admin.css": /^(web\/static\/css\/admin)/
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    assets: /^(web\/static\/assets)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "web/static",
      "test/static"
    ],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/web\/static\/vendor/]
    },
    postcss: {
      processors: [
        require('autoprefixer')(['last 8 versions']),
        require('postcss-cssnext'),
        require('postcss-import'),
        require('postcss-nested'),
        require('postcss-nesting')
      ]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["web/static/js/app"]
    }
  },

  npm: {
    enabled: true,
    // Whitelist the npm deps to be pulled in as front-end assets.
    // All other deps in package.json will be excluded from the bundle.
    whitelist: ["phoenix", "phoenix_html", "vue", "reqwest", "underscore"]
  }
};
