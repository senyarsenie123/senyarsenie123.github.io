$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

Dir[File.expand_path('../api/*.rb', __dir__)].sort.each do |f|
  require f
end

require 'app'
