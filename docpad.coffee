moment = require 'moment'

docpadConfig = {

    # =================================
    # Template Data
    # These are variables that will be accessible via our templates
    # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

    templateData:

        # Specify some site properties
        site:
            url: 'http://vovanr.com'
            title: 'Блог Владимира Родкина'
            author: 'Владимир Родкин'
            description: 'Про фронт-энд'
            copyrightUrl: 'http://twitter.com/VovanR'
            twitter: '@VovanR'
            styles: [
                '/styles/style.css'
            ]
            tagNames:
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
                development: 'Development'
                diagnostics: 'Diagnostics'
                diff: 'diff'
                django: 'Django'
                dns: 'DNS'
                dnsmasq: 'Dnsmasq'
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
                svn: 'SVN'
                ubuntu: 'Ubuntu'
                virtualbox: 'VirtualBox'

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
            moment(date).format('LL')  # December 23 2013


    # Collections

    collections:
        posts: ->
            @getCollection('html').findAllLive({ relativeOutDirPath: 'posts' }, [date:-1])
        services: ->
            @getCollection('html').findAllLive({ relativeOutDirPath: 'services' }, [date:-1])


    plugins:
        stylus:
            stylusOptions:
                compress: true
        ghpages:
            deployRemote: 'origin'
            deployBranch: 'master'
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


    # Events

    events:
        generateBefore: (opts) ->
            # Configure Moment.js
            moment.locale('ru')
}

# Export our DocPad Configuration
module.exports = docpadConfig
