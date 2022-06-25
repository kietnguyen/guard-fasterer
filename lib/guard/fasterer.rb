require "guard/fasterer/version"

module Guard
  class Fasterer < Plugin
    def initialize(options = {})
      super

      @options = {run_on_start: false, bundler: File.exist?("#{Dir.pwd}/Gemfile")}.merge(options)
    end

    def bundler?
      @options[:bundler]
    end

    def run_on_start?
      @options[:run_on_start]
    end

    def start
      run_fasterer if run_on_start?
      true
    end

    def stop
      true
    end

    def reload
      true
    end

    def run_all
      run_fasterer
    end

    def run_on_change(paths)
      run_fasterer(paths)
    end

    private

    def run_fasterer(paths = [])
      cmd = []
      cmd << "bundle exec" if bundler?
      cmd << "fasterer"
      cmd += paths unless paths.empty?

      system(cmd.join(" "))
    end
  end
end
