class Condition
    def initialize(val1, oper, val2)
        @val1 = val1;
        @oper = oper;
        @val2 = val2;
        @valera = Valera.instance
    end

    def true?
        a = @valera.send(@val1)
        b = a.send(@oper, @val2)
        #puts b
        b
    end
end