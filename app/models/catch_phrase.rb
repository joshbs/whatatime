class CatchPhrase
  @phrases = [
    "where your time can just <em>be</em> time",
    "you break it, we time it",
    "don't worry about time, that's why we're here",
    "if it takes time, we like it a lot more"
  ]
  
  def self.all
  end
  
  def self.random
    @phrases.sort_by{ rand }.first
  end
end
