pipelineJob('Your App Pipeline') { 

  def repo = 'https://github.com/MaksimAstapkovich/ProjectForJenkins.git' 
  def sshRepo = 'git@github.com:MaksimAstapkovich/ProjectForJenkins.git' 

  description("Your App Pipeline") 
  keepDependencies(false) 

  properties{ 

    githubProjectUrl (repo) 
    rebuild { 
      autoRebuild(false) 
    } 
  }
  triggers{
    scm("H/5 * * * *")
  } 

  definition { 

    cpsScm { 
      scm { 
        git { 
          remote { url(repo) 
	    credentials("GitHub")
	  } 
          branches('master') 
          scriptPath('Jenkinsfile') 
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want 
        } 
      } 
    } 
  }
}
