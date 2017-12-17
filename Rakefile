$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'rake_terraform'
require 'confidante'
require 'yaml'

RakeTerraform.define_installation_tasks(
    path: File.join(Dir.pwd, 'vendor', 'terraform'),
    version: '0.10.8')

configuration = Confidante.configuration

task :default => [
    :'bootstrap:plan',
    :'network:plan',
    :'cluster:plan'
]

namespace :names do
  task :random do
    puts
    puts YAML.load_file('config/names.yaml')['elements'].sample
  end
end

namespace :bootstrap do
  RakeTerraform.define_command_tasks do |t|
    t.argument_names = [:deployment_identifier]

    t.configuration_name = 'bootstrap'
    t.source_directory = 'infra/bootstrap'
    t.work_directory = 'build'

    t.state_file = lambda do |args|
      deployment_identifier =
        configuration
            .for_overrides(args)
            .deployment_identifier

      File.join(Dir.pwd, "state/bootstrap-#{deployment_identifier}.tfstate")
    end

    t.vars = lambda do |args|
      deployment_identifier =
          configuration
              .for_overrides(args)
              .deployment_identifier

      configuration
          .for_overrides(args)
          .for_scope(
              role: 'bootstrap',
              deployment: deployment_identifier)
          .vars
    end
  end
end

namespace :network do
  RakeTerraform.define_command_tasks do |t|
    t.argument_names = [:deployment_identifier]

    t.configuration_name = 'network'
    t.source_directory = 'infra/network'
    t.work_directory = 'build'

    t.backend_config = lambda do |args|
      deployment_identifier =
          configuration
              .for_overrides(args)
              .deployment_identifier

      configuration
          .for_overrides(args)
          .for_scope(
              role: 'network',
              deployment: deployment_identifier)
          .backend_config
    end

    t.vars = lambda do |args|
      deployment_identifier =
          configuration
              .for_overrides(args)
              .deployment_identifier

      configuration
          .for_overrides(args)
          .for_scope(
              role: 'network',
              deployment: deployment_identifier)
          .vars
    end
  end
end

namespace :cluster do
  RakeTerraform.define_command_tasks do |t|
    t.argument_names = [:deployment_identifier]

    t.configuration_name = 'cluster'
    t.source_directory = 'infra/cluster'
    t.work_directory = 'build'

    t.backend_config = lambda do |args|
      deployment_identifier =
          configuration
              .for_overrides(args)
              .deployment_identifier

      configuration
          .for_overrides(args)
          .for_scope(
              role: 'cluster',
              deployment: deployment_identifier)
          .backend_config
    end

    t.vars = lambda do |args|
      deployment_identifier =
          configuration
              .for_overrides(args)
              .deployment_identifier

      configuration
          .for_overrides(args)
          .for_scope(
              role: 'cluster',
              deployment: deployment_identifier)
          .vars
    end
  end
end
