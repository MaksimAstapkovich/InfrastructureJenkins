import jenkins.model.Jenkins
import com.cloudbees.plugins.credentials.domains.Domain
import com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl
import com.cloudbees.plugins.credentials.CredentialsScope

instance = Jenkins.instance
domain = Domain.global()
store = instance.getExtensionList("com.cloudbees.plugins.credentials.SystemCredentialsProvider")[0].getStore()

usernameAndPassword = new UsernamePasswordCredentialsImpl(
  CredentialsScope.GLOBAL,
  "github",
  "github",
  "MaksimAstapkovich",
  "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"
)
usernameAndPass = new UsernamePasswordCredentialsImpl(
  CredentialsScope.GLOBAL,
  "GitHub",
  "GitHub",
  "MaksimAstapkovich",
  "lolol"
)
usernameAndPas = new UsernamePasswordCredentialsImpl(
  CredentialsScope.GLOBAL,
  "max_dh",
  "max_dh",
  "mastapkovich",
  "kokok"
)


store.addCredentials(domain, usernameAndPassword)
store.addCredentials(domain, usernameAndPass)
store.addCredentials(domain, usernameAndPas)
