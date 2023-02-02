class Computer

    #self - refers to the current instance - self referential
    #@ - refers to the current instance attribute (uses property directly)
    #@@ - refers to a class attribute

    attr_reader :brand, :model
    attr_accessor :memory_GB, :storage_free

    @@brands = []
    @@models = []
    @@all = []
    @@largest_memory = nil

    # your code here
    def initialize(brand, model)
        @brand = brand 
        @model = model 
        @memory_GB = 8 
        @storage_free = 1000 

        #!@@brands.include?(brand) ? @@brands << brand : nil
        @@brands << brand unless @@brands.include?(brand)

        #!@@models.include?(model) ? @@models << model : nil
        @@models << model unless @@models.include?(model)

        @@all << self

        @@largest_memory = self unless @@largest_memory != nil
    end 


    #given object, add ram to current ram
    def upgrade_memory(ram)
        @memory_GB += ram[:size]
        #conditional to update instance with largest memory
        @@largest_memory = self unless @@largest_memory.memory_GB > @memory_GB
    end 

    #detect if there is enough space
    def enough_space?(size)
        @storage_free >= size
    end 

    def save_file(file)
        if enough_space?(file[:size])
            @storage_free -= file[:size]
            return "#{file[:name]} has been saved!"
        else 
            return "There is not enough space on disk to save #{file[:name]}."
        end 
    end

    #{ name: "", size: 0 }
    def delete_file(file)
        @storage_free += file[:size]
        "File #{file[:name]} has been successfully deleted."
    end 

    def specs
        "Computer has #{memory_GB}GB in memory and #{@storage_free}GB in storage." 
    end 

    def self.brands 
        @@brands
    end 

    def self.models 
        @@models 
    end 

    def self.largest_memory 
        @@largest_memory
    end 

    def self.all 
        @@all 
    end 

    
end

# you can write code here to test your solution
# create an instance of Computer
# call methods on it
