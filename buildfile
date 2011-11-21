
require 'buildr/ivy_extension'

VERSION_NUMBER = ENV['version'] || 'SNAPSHOT'

repositories.remote << "http://www.ibiblio.org/maven2/"
repositories.release_to = 'sftp://joist.ws/var/joist.repo'
repositories.release_to[:permissions] = 0644

# to resolve the ${revision} in the ivy.xml
Java.java.lang.System.setProperty("truss.version", VERSION_NUMBER)

define 'truss' do
  project.version = VERSION_NUMBER
  project.group = 'org.exigencecorp.truss'
  ivy.compile_conf(['compile', 'provided']).test_conf('test')
  test.resources.from(_('src/test/java'))

  package_with_sources

  package(:jar).pom.tap do |pom|
    pom.enhance [task('ivy:makepom')]
    pom.from 'target/pom.xml'
  end
end

