moment = require 'moment'

docpadConfig = {
  # =================================
  # Template Data
  # These are variables that will be accessible via our templates
  # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ
  templateData:
    # Specify some site properties
    site:
      url: 'https://vovanr.com'
      title: 'Vladimir Rodkin'
      author: 'Vladimir Rodkin'
      description: 'About Front-end'
      copyrightUrl: 'https://twitter.com/VovanR'
      twitter: '@VovanR'
      mastodonUrl: 'https://mastodon.social/@vovanr'
      siteSourceURL: 'https://github.com/VovanR/VovanR.github.io'
      socialLinks: [
        {
          name: 'Twitter'
          url: 'https://twitter.com/VovanR'
        }
        {
          name: 'Mastodon'
          url: 'https://mastodon.social/@vovanr'
        }
        {
          name: 'GitHub'
          url: 'https://github.com/VovanR'
        }
        {
          name: 'npm'
          url: 'https://www.npmjs.com/~vovanr'
        }
      ]
      styles: [
        '/styles/style.css'
      ]
      tagNames:
        'gh-pages': 'GitHub Pages'
        'wd-mybook-live': 'WD My Book Live'
        actions: 'Actions'
        amd: 'AMD'
        apache: 'Apache'
        atom: 'Atom'
        backup: 'Backup'
        bash: 'Bash'
        bookmarklet: 'Bookmarklet'
        bower: 'Bower'
        bug: 'Bug'
        css: 'CSS'
        deploy: 'Deploy'
        development: 'Development'
        diagnostics: 'Diagnostics'
        diff: 'diff'
        django: 'Django'
        dns: 'DNS'
        dnsmasq: 'Dnsmasq'
        docker: 'Docker'
        favicon: 'Favicon'
        git: 'Git'
        html: 'HTML'
        ie: 'Internet Explorer'
        java: 'Java'
        javascript: 'JavaScript'
        lamp: 'LAMP'
        linux: 'Linux'
        meld: 'Meld'
        netbeans: 'NetBeans'
        nodejs: 'Node.js'
        photoshop: 'Photoshop'
        php: 'PHP'
        requirejs: 'RequireJS'
        svg: 'SVG'
        svn: 'SVN'
        travis: 'Travis CI'
        ubuntu: 'Ubuntu'
        virtualbox: 'VirtualBox'
        windows: 'Windows'

    # Get the prepared site/document title
    # Often we would like to specify particular formatting to our page's title
    # we can apply that formatting here
    pageTitle: ->
      # if we have a document title, then we should use that and suffix the site's title onto it
      if @document.title
        @document.title

      # if our document does not have it's own title, then we should just use the site's title
      else
        @site.title

    # Localized date
    pubDate: (date) ->
      # December 23 2013
      moment(date).format('LL')

    pubDateForDatetimeAttribute: (date) ->
      moment(date).format('YYYY-MM-DD')

    postSourceURL: ->
      @site.siteSourceURL + '/src/documents/posts/' + @document.filename


  # Collections
  collections:
    posts: ->
      @getCollection('html').findAllLive({ relativeOutDirPath: 'posts' }, [date:-1])


  plugins:
    stylus:
      stylusOptions:
        compress: true

    sitemap:
      cachetime: 600000
      changefreq: 'weekly'
      priority: 0.5
      filePath: 'sitemap.xml'

    rss:
      default:
        collection: 'posts'

    marked:
      markedOptions:
        pedantic: false
        gfm: true
        sanitize: false
        highlight: null

    highlightjs:
      replaceTab: null
      aliases:
        yaml: 'python'
        shell: 'bash'
        svg: 'html'


  # Events
  events:
    generateBefore: (opts) ->
      # Configure Moment.js
      moment.locale('en')
}

# Export our DocPad Configuration
module.exports = docpadConfig
