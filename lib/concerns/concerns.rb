module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect {|e| e.name == name }
    end

    def find_or_create_by_name(name)
      var = self.find_by_name(name)
      if var
        return var
      else
        return self.create(name)
      end
    end
  end
end
