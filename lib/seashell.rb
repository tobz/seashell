class Seashell
    attr_writer :debug

    def initialize
        @debug = false
        @indent = 0
    end

    def _indent
        "    " * @indent
    end

    def indent
        @indent = @indent + 1
    end

    def unindent
        @indent = (@indent - 1) unless @indent == 0
    end

    def _level(l, s)
        l.upcase!

        case l
        when "ACTION"
            l = _yellow(l)
        when "INFO"
            l = _pink(l)
        when "DEBUG"
            l = _cyan(l)
        end

        !@debug ? s : "#{l} #{s}"
    end

    def action(s)
        print _level("action", _indent + s)
        $stdout.flush
    end

    def msg(s)
        puts _level("info", _indent + s)
    end

    def debug(s)
        puts _level("debug", _indent + s) unless !@debug
    end

    def tick
        putc "."
    end

    def ok
        print " [" + _green("OK") + "]\n"
        $stdout.flush
    end

    def done
        print " [" + _green("DONE") + "]\n"
        $stdout.flush
    end

    def failed
        print " [" + _red("FAILED") + "]\n"
        $stdout.flush
    end

    def error
        print " [" + _red("ERROR") + "]\n"
        $stdout.flush
    end

    def _colorize(c, s)
        "\e[#{c}m#{s}\e[0m"
    end

    def _green(s); _colorize(32, s); end
    def _red(s); _colorize(31, s); end
    def _cyan(s); _colorize(36, s); end
    def _yellow(s); _colorize(33, s); end
    def _blue(s); _colorize(34, s); end
    def _pink(s); _colorize(35, s); end
    def _white(s); _colorize(37, s); end
end
