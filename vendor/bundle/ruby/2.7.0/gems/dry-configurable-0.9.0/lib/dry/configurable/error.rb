module Dry
  module Configurable
    Error = Class.new(::StandardError)
    AlreadyDefinedConfig = ::Class.new(Error)
    FrozenConfig = ::Class.new(Error)
  end
end
