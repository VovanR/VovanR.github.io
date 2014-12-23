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
            title: 'VovanR.com'
            author: 'Владимир Родкин'
            description: 'О фронт-энде, кодинге и дизайне'
            copyrightUrl: 'http://twitter.com/VovanR'
            twitter: '@VovanR'
            styles: [
                '/styles/style.css'
            ]
            tagNames:
                'wd-mybook-live': 'WD My Book Live'
                actions: 'Actions'
                apache: 'Apache'
                backup: 'Backup'
                bash: 'Bash'
                bookmarklet: 'Bookmarklet'
                bower: 'Bower'
                bug: 'Bug'
                css: 'CSS'
                diagnostics: 'Diagnostics'
                diff: 'diff'
                django: 'Django'
                dns: 'DNS'
                dnsmasq: 'Dnsmasq'
                html: 'HTML'
                java: 'Java'
                javascript: 'JavaScript'
                lamp: 'LAMP'
                linux: 'Linux'
                meld: 'Meld'
                netbeans: 'NetBeans'
                photoshop: 'Photoshop'
                php: 'PHP'
                svn: 'SVN'
                ubuntu: 'Ubuntu'
                virtualbox: 'VirtualBox'

        # Get the prepared site/document title
        # Often we would like to specify particular formatting to our page's title
        # we can apply that formatting here
        pageTitle: ->
            # if we have a document title, then we should use that and suffix the site's title onto it
            if @document.title
                "#{@document.title} — #{@site.title}"
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


    plugins:
        robotskirt:
            robotskirtOptions:
                EXT_AUTOLINK: false
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


    # Events

    events:
        generateBefore: (opts) ->
            # Configure Moment.js
            moment.lang('ru')
}

# Export our DocPad Configuration
module.exports = docpadConfig
