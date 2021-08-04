#!groovy

job("seed") {
        description 'Create main job'
        steps {
            dsl {
            external('scr_04_pip.groovy')
            removeAction('DISABLE')
            ignoreExisting()
            }
        }
}
