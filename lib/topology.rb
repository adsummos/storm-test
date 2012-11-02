require 'red_storm'

require_relative 'test_spout'

class Topology

  RedStorm::Configuration.topology_class = self

  def start(base_class_path, env)

    builder = TopologyBuilder.new
    builder.setSpout('TestSpout', JRubySpout.new(base_class_path, "TestSpout", ["field"]), 1)

    config = Backtype::Config.new

    if env == :local
      cluster = LocalCluster.new
      cluster.submitTopology("test_topology", config, builder.createTopology)
    else
      StormSubmitter.submitTopology("test_topology", config, builder.createTopology);
    end
  end
end
