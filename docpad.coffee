moment = require 'moment'

docpadConfig = {

    # =================================
    # Template Data
    # These are variables that will be accessible via our templates
    # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

    templateData:

        # Specify some site properties
        site:
            title: 'Блог Владимира Родкина'
            author: 'Владимир Родкин'
            copyrightUrl: 'http://twitter.com/VovanR'
            styles: [
                'vendor/normalize-css/normalize.css'
            ]

        # Localized date
        pubDate: (date) ->
            moment(date).format('LL')  # December 23 2013


    # Collections

    collections:
        posts: ->
            @getCollection('html').findAllLive({ relativeOutDirPath: 'posts' })


    plugins:
        robotskirt:
            robotskirtOptions:
                EXT_AUTOLINK: false


    # Events

    events:
        generateBefore: (opts) ->
            # Configure Moment.js
            moment.lang('ru')
}

# Export our DocPad Configuration
module.exports = docpadConfig
