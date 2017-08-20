$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'rake_terraform'

require 'configuration'

RakeTerraform.define_installation_tasks(
    path: File.join(Dir.pwd, 'vendor', 'terraform'),
    version: '0.9.8')

configuration = Configuration.new

task :default => [
    :'common:plan',
    :'network:plan'
]

namespace :common do
  RakeTerraform.define_command_tasks do |t|
    t.configuration_name = 'common'
    t.source_directory = 'infra/common'
    t.work_directory = 'build'

    t.backend_config = lambda do
      configuration
          .for_scope(role: 'common')
          .backend_config
    end

    t.vars = lambda do
      configuration
          .for_scope(role: 'common')
          .vars
    end
  end
end

namespace :network do
  RakeTerraform.define_command_tasks do |t|
    t.argument_names = [:deployment_identifier]

    t.configuration_name = 'mining network'
    t.source_directory = 'infra/network'
    t.work_directory = 'build'

    t.backend_config = lambda do |args|
      configuration
          .for_args(args)
          .for_scope(role: 'network')
          .backend_config
    end

    t.vars = lambda do |args|
      configuration
          .for_args(args)
          .for_scope(role: 'network')
          .vars
    end
  end
end

namespace :cluster do
  RakeTerraform.define_command_tasks do |t|
    t.argument_names = [:deployment_identifier]

    t.configuration_name = 'mining cluster'
    t.source_directory = 'infra/cluster'
    t.work_directory = 'build'

    t.backend_config = lambda do |args|
      configuration
          .for_args(args)
          .for_scope(role: 'cluster')
          .backend_config
    end

    t.vars = lambda do |args|
      configuration
          .for_args(args)
          .for_scope(role: 'cluster')
          .vars
    end
  end
end
