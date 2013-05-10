class Project extends Backbone.Model

  url: ->
    "/projects/#{@name}"

  initialize: (options)->
    @id = options.id
    @name = options.name

# Exports

window.Mgmt.Models.Project = Project