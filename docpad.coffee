moment = require 'moment'

docpadConfig = {

    # =================================
    # Template Data
    # These are variables that will be accessible via our templates
    # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

    templateData:

        # Specify some site properties
        site:
            title: 'VovanR.com'
            author: 'Владимир Родкин'
            description: 'О фронт-энде, кодинге и дизайне'
            copyrightUrl: 'http://twitter.com/VovanR'
            twitter: '@VovanR'
            styles: [
                '/vendor/normalize-css/normalize.css'
                '/vendor/pure/pure.css'
                '/styles/hljs/solarized_light.css'
                '/styles/style.css'
            ]

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


    # Events

    events:
        generateBefore: (opts) ->
            # Configure Moment.js
            moment.lang('ru')
}

# Export our DocPad Configuration
module.exports = docpadConfig
