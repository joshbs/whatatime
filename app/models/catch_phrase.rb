class CatchPhrase
  @phrases = [
    "where your time can just <em>be</em> time",
    "you break it, we time it",
    "don't worry about time, that's why we're here",
    "if it takes time, we like it a lot more",
    "we're like <em>red-light green-light</em> for your time",
    "we want your time back"
  ]
  
  def self.all
    @phrases
  end
  
  def self.random
    @phrases.sort_by{ rand }.first
  end
end
