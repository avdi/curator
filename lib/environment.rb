require 'pathname'
ROOT = Pathname.new(__FILE__).expand_path.dirname.parent
Pathname.glob(ROOT + 'vendor' + '*' + 'lib').each do |path|
  $LOAD_PATH.unshift(path.to_s)
end
$LOAD_PATH.unshift(ROOT + 'lib')
