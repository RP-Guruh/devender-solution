class Company < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        #Tambahkan kedalam array, untuk field field yang diizinkan
        #Untuk dilakukan pencarian
        ["name", "industry", "year"]
    end
    
    def self.ransackable_associations(auth_object = nil)
       []
    end
  has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
end
