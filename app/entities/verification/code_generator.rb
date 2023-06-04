class Verification::CodeGenerator
    App_name = 'YouStore'

    def generate_code(indexes_to_replace)
        code_exploded = rand.to_s[2..7].split('')
        selected_value = code_exploded[rand(0...code_exploded.length())]
        for i in 0..indexes_to_replace
            code_exploded[rand(0...code_exploded.length())] = selected_value
        end
        return code_exploded.join('')
    end

    def generate_sms_message(code)
        return 'Ваш проверочный код ' + App_name + ': ' + code
    end
end