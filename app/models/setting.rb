class Setting < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        #Tambahkan kedalam array, untuk field field yang diizinkan
        #Untuk dilakukan pencarian
        ["key"]
    end
    
    def self.ransackable_associations(auth_object = nil)
       []
    end
end
