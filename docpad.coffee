docpadConfig = {

    # =================================
    # Template Data
    # These are variables that will be accessible via our templates
    # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

    templateData:

        # Specify some site properties
        site:

            styles: [
                'bower_components/normalize-css/normalize.css'
            ]


    # Collections

    collections:
        posts: ->
            @getCollection('html').findAllLive({ relativeOutDirPath: 'posts' })

}

# Export our DocPad Configuration
module.exports = docpadConfig
