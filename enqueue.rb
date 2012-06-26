require 'resque'
require './job'
Resque.enqueue(Job, 30)
