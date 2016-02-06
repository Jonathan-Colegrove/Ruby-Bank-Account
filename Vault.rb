class Account
  
  
def initialize(name, balance=1000)
        @name = name
        @balance = balance
end

    #Provide pin + options
    def choose(pw)
        
        puts "Please enter your pin #"
        pw = gets.chomp
        if pw == "#{$pin}"
            puts "What do you need from your vault?
                withdraw
                deposit
                balance
                end"
            action = gets.chomp

        #defining actions
        case action         
            when "balance" then display_balance
            when "withdraw" then puts "How much would you like to withdraw? (multiples of $1 only)"
                amount = gets.chomp.gsub(/\D/,'').to_i
                withdraw(amount)
            when "deposit" then puts "How much would you like to deposit? (multiples of $1 only)"
                amount = gets.chomp.gsub(/\D/,'').to_i
                deposit(amount)
            when "end" then puts "Have a wonderful day!"
            else return home
        end
        else 
            puts "Sorry, that pin won't work for your vault. Please try again."
            return choose(" ")
        end
    end 

    #options after pin
    def home
        puts "What do you need from your vault?
                withdraw
                deposit
                balance
                end"

            action = gets.chomp
        
        case action

            when "withdraw" then puts "How much would you like to withdraw? (multiples of $1 only)"
                amount = gets.chomp.gsub(/\D/,'').to_i
                withdraw(amount)
            when "deposit" then puts "How much would you like to deposit? (multiples of $1 only)"
                amount = gets.chomp.gsub(/\D/,'').to_i
                deposit(amount)
            when "balance" then display_balance
            when "end" then puts "Have a wonderful day!"
                else return home
        end
    end
    
    def display_balance()
        puts "Your balance is:$#{@balance}."
        return home
    end
    
    def withdraw(amount)
        if amount <= @balance
        @balance -= amount
        puts "Please take your money below. Your new balance is:$#{@balance}"
        return home
        else 
        puts "Sorry about that: your vault only has $#{@balance} to withdraw."
        return home
        end
    end
    
    
    def deposit(amount)
        @balance += amount
        puts "#{amount} has been successfully stored in your vault. \n
        Your new balance is $#{@balance}"
        return home
    end
    
    #hiding the pin
    private 
    def pin
        password = $pin
    end

end


#greeting
def enter
    puts "Welcome to the Vault, the world's most secure banking system. \n
    Would you like to create a new account? (Yes/No) \n
    The minimum balance to start an account is $1,000."
    answer = gets.chomp
    answer.downcase!
        if answer == "yes"
           puts "It's a pleasure to serve you. What is your name?"
           name = gets.chomp
           @pick = Account.new(name)
           puts "Great, #{name}. Your personal vault is now open."
           return password
        else
            puts "All good.  Have a wonderful day!"
        end
end

def password
    puts "Please choose a six digit pin #"
           $pin = gets.chomp
           unless $pin.length != 6 
            @pick.choose(" ")
            else
            puts "Forgetting something? You need the correct six digits to enter your vault."
           return password
        end
end

enter