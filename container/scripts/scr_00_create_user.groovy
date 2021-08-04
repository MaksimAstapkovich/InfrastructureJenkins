#!groovy

import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()

println "--> creating local user 'admin'"

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
  hudsonRealm.createAccount('mastapkovich','mastapkovich')
  instance.setSecurityRealm(hudsonRealm)

def strategy = new hudson.security.GlobalMatrixAuthorizationStrategy()
  strategy.add(Jenkins.ADMINISTER, 'authenticated')
  instance.setAuthorizationStrategy(strategy)
  instance.save()
