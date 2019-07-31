require 'irb/completion'
require_relative 'app'
include Ly

AwesomePrint.defaults = {
  :indent => 2,
  :index => false
}
AwesomePrint.pry!