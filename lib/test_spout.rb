class TestSpout

    def open(conf, context, collector)
      @collector = collector
    end

    def next_tuple
      @collector.emit(Values.new("test"))
    end

    def get_component_configuration
    end

    def declare_output_fields(declarer)
      declarer.declare(Fields.new(["field"]))
    end

  end