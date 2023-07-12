
struct Abstraction

    code::Code
    env::Env
end

function evaluate(code, env)
    if code.head == :__abstraction__
        return Abstraction(code, env)    
    end

    if code.head == :__aplication__
        operator = evaluate(code.first, env)
        operand = evaluate(code.second, env)
        return operator(operand)
    end
        
    



